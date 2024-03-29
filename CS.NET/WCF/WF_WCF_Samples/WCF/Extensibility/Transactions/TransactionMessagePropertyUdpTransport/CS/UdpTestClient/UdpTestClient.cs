﻿//  Copyright (c) Microsoft Corporation. All rights reserved.

using System;
using System.ServiceModel;
using System.Threading;
using System.Transactions;

namespace Microsoft.ServiceModel.Samples
{
    class UdpTestClient
    {
        static void Main(string[] args)
        {
            Console.Out.WriteLine("Testing Udp From Imported Files Generated By SvcUtil.");

            // the endpointConfigurationName parameter must reflect the one in config.
            DatagramContractClient datagramClient = new DatagramContractClient("CustomBinding_IDatagramContract");
            try
            {
                for (int i = 0; i < 5; i++)
                {
                    datagramClient.Hello();
                }

                datagramClient.Close();
            }
            catch (TimeoutException)
            {
                datagramClient.Abort();
            }
            catch (CommunicationException)
            {
                datagramClient.Abort();
            }
            catch (Exception)
            {
                datagramClient.Abort();
                throw;
            }

            Thread.Sleep(5000);//want to wait 3s for the service to finish processing first batch of messages

            // the endpointConfigurationName parameter must reflect the one in config.
            CalculatorContractClient calculatorClient = new CalculatorContractClient("SampleProfileUdpBinding_ICalculatorContract");

            // Add a TransactionFlowBehavior, which in turn adds a message inspector that appends the current 
            // transaction on the message (via a TransactionFlowProperty). We need this in order to ensure 
            // that the channel receives the current transaction (the framework may call the channel on a different 
            // thread, and the current transaction would be missing) and flows it to the service.
            calculatorClient.Endpoint.Behaviors.Add(new TransactionFlowBehavior());
             
            try
            {                             
                for (int i = 0; i < 5; ++i)
                {
                    // call the 'Add' service operation under a transaction scope
                    using (TransactionScope ts = new TransactionScope())
                    {                     
                        TransactionInterop.GetDtcTransaction(Transaction.Current); //promote transaction to DTC in order to have a distributed id
                        Console.WriteLine(calculatorClient.Add(i, i * 2, Transaction.Current.TransactionInformation.DistributedIdentifier));
                        ts.Complete();
                    }
                }
                    
                calculatorClient.Close();
            }
            catch (TimeoutException)
            {
                calculatorClient.Abort();
            }
            catch (CommunicationException)
            {
                calculatorClient.Abort();
            }
            catch (Exception)
            {
                calculatorClient.Abort();
                throw;
            }

            Console.Out.WriteLine("Press <ENTER> to complete test.");
            Console.In.ReadLine();
        }
    }
}
