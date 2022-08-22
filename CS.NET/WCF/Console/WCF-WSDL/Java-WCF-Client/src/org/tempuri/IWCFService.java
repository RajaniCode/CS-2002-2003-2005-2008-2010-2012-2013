
package org.tempuri;

import java.util.concurrent.Future;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.AsyncHandler;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.Response;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.9-b130926.1035
 * Generated source version: 2.2
 * 
 */
@WebService(name = "IWCFService", targetNamespace = "http://tempuri.org/")
@XmlSeeAlso({
    com.microsoft.schemas._2003._10.serialization.ObjectFactory.class,
    org.tempuri.ObjectFactory.class
})
public interface IWCFService {


    /**
     * 
     * @param data
     * @return
     *     returns javax.xml.ws.Response<org.tempuri.GetDataResponse>
     */
    @WebMethod(operationName = "GetData", action = "http://tempuri.org/IWCFService/GetData")
    @RequestWrapper(localName = "GetData", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetData")
    @ResponseWrapper(localName = "GetDataResponse", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetDataResponse")
    public Response<GetDataResponse> getDataAsync(
        @WebParam(name = "data", targetNamespace = "http://tempuri.org/")
        String data);

    /**
     * 
     * @param data
     * @param asyncHandler
     * @return
     *     returns java.util.concurrent.Future<? extends java.lang.Object>
     */
    @WebMethod(operationName = "GetData", action = "http://tempuri.org/IWCFService/GetData")
    @RequestWrapper(localName = "GetData", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetData")
    @ResponseWrapper(localName = "GetDataResponse", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetDataResponse")
    public Future<?> getDataAsync(
        @WebParam(name = "data", targetNamespace = "http://tempuri.org/")
        String data,
        @WebParam(name = "asyncHandler", targetNamespace = "")
        AsyncHandler<GetDataResponse> asyncHandler);

    /**
     * 
     * @param data
     * @return
     *     returns java.lang.String
     */
    @WebMethod(operationName = "GetData", action = "http://tempuri.org/IWCFService/GetData")
    @WebResult(name = "GetDataResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "GetData", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetData")
    @ResponseWrapper(localName = "GetDataResponse", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetDataResponse")
    public String getData(
        @WebParam(name = "data", targetNamespace = "http://tempuri.org/")
        String data);

}