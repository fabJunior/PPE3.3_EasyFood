package com.ppe3_3.dao;

public class DAOException extends RuntimeException {

    /*

     * Constructeurs

     */

    public DAOException( String message ) {

        super( message );

    }


    public DAOException( String message, Throwable cause ) {

        super( message, cause );

    }


    public DAOException( Throwable cause ) {

        super( cause );

    }

}