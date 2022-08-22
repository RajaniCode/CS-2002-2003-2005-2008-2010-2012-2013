/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 * 
 *  http://aws.amazon.com/apache2.0
 * 
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */
using System;
using System.Collections.Generic;
using System.Xml.Serialization;
using System.Text;

using Amazon.Runtime;

namespace Amazon.DataPipeline.Model
{
    /// <summary>
    /// Returns information about the  SetTaskStatusResult response and response metadata.
    /// </summary>
    public class SetTaskStatusResponse : AmazonWebServiceResponse
    {
        private SetTaskStatusResult setTaskStatusResult;

        /// <summary>
        /// Gets and sets the SetTaskStatusResult property.
        /// The output from the SetTaskStatus action.
        /// </summary>
        public SetTaskStatusResult SetTaskStatusResult
        {
            get
            {
                if(this.setTaskStatusResult == null)
                {
                    this.setTaskStatusResult = new SetTaskStatusResult();
                }

                return this.setTaskStatusResult;
            }
            set { this.setTaskStatusResult = value; }
        }
    }
}
    
