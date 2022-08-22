﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.42
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace Microsoft.ServiceModel.Samples
{
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://Microsoft.ServiceModel.Samples", ConfigurationName="Microsoft.ServiceModel.Samples.IServiceDescriptionCalculator")]
    public interface IServiceDescriptionCalculator
    {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/Add", ReplyAction="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/AddResponse")]
        int Add(int n1, int n2);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/Subtract", ReplyAction="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/SubtractRespo" +
            "nse")]
        int Subtract(int n1, int n2);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/Multiply", ReplyAction="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/MultiplyRespo" +
            "nse")]
        int Multiply(int n1, int n2);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/Divide", ReplyAction="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/DivideRespons" +
            "e")]
        int Divide(int n1, int n2);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/GetServiceDes" +
            "criptionInfo", ReplyAction="http://Microsoft.ServiceModel.Samples/IServiceDescriptionCalculator/GetServiceDes" +
            "criptionInfoResponse")]
        string GetServiceDescriptionInfo();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public interface IServiceDescriptionCalculatorChannel : Microsoft.ServiceModel.Samples.IServiceDescriptionCalculator, System.ServiceModel.IClientChannel
    {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public partial class ServiceDescriptionCalculatorClient : System.ServiceModel.ClientBase<Microsoft.ServiceModel.Samples.IServiceDescriptionCalculator>, Microsoft.ServiceModel.Samples.IServiceDescriptionCalculator
    {
        
        public ServiceDescriptionCalculatorClient()
        {
        }
        
        public ServiceDescriptionCalculatorClient(string endpointConfigurationName) : 
                base(endpointConfigurationName)
        {
        }
        
        public ServiceDescriptionCalculatorClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress)
        {
        }
        
        public ServiceDescriptionCalculatorClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress)
        {
        }
        
        public ServiceDescriptionCalculatorClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress)
        {
        }
        
        public int Add(int n1, int n2)
        {
            return base.Channel.Add(n1, n2);
        }
        
        public int Subtract(int n1, int n2)
        {
            return base.Channel.Subtract(n1, n2);
        }
        
        public int Multiply(int n1, int n2)
        {
            return base.Channel.Multiply(n1, n2);
        }
        
        public int Divide(int n1, int n2)
        {
            return base.Channel.Divide(n1, n2);
        }
        
        public string GetServiceDescriptionInfo()
        {
            return base.Channel.GetServiceDescriptionInfo();
        }
    }
}
