/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.heig.amt.webapp.rest.dto;

/**
 *
 * @author antoi
 */
public class ErrorDTO {
    private String error;
    
    public ErrorDTO(){
        
    }

    public ErrorDTO(String error) {
        this.error = error;
    }
    
    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    
}
