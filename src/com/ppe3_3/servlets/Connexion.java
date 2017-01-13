package com.ppe3_3.servlets;

import java.io.IOException;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import com.ppe3_3.beans.Utilisateur;

import com.ppe3_3.dao.DAOFactory;

import com.ppe3_3.dao.UtilisateurDao;

import com.ppe3_3.forms.ConnexionForm;


public class Connexion extends HttpServlet {

    public static final String CONF_DAO_FACTORY = "daofactory";

    public static final String ATT_USER         = "utilisateur";

    public static final String ATT_FORM         = "form";

    public static final String VUE              = "/connexion.jsp";


    private UtilisateurDao     utilisateurDao;


    public void init() throws ServletException {

        /* Récupération d'une instance de notre DAO Utilisateur */

        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();

    }


    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        /* Affichage de la page d'inscription */

        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }


    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        /* Préparation de l'objet formulaire */

        ConnexionForm form = new ConnexionForm( utilisateurDao );


        /* Traitement de la requête et récupération du bean en résultant */

        Utilisateur utilisateur = form.connecterUtilisateur( request );


        /* Stockage du formulaire et du bean dans l'objet request */

        request.setAttribute( ATT_FORM, form );

        request.setAttribute( ATT_USER, utilisateur );


        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }

}