/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.elmrest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import static javax.ws.rs.HttpMethod.POST;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import net.minidev.json.JSONObject;
import sun.net.www.content.text.plain;

/**
 * REST Web Service
 *
 * @author seana
 */
@Path("counter")
public class CounterResource {
    private Counter counter;

    /**
     * Creates a new instance of CounterResource
     */
    public CounterResource() {
        this.counter = new Counter();
    }

    /**
     * Retrieves representation of an instance of com.mycompany.elmrest.CounterResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCounterAmt(String jsonContent) throws IOException
    {
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        return Response.ok(gson.toJson(counter.getCount()), MediaType.APPLICATION_JSON).build();
    }
    
    @POST
    @Path("/{param}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces("text/plain")
    public Response postCount(@PathParam("param") int msg) {
//        String output = "POST:complete";
//        counter.setCount(msg);
//        return Response.status(200).entity(output).build();
        return Response.status(200).build();
    }
}
