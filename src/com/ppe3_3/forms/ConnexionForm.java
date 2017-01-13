package com.ppe3_3.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import com.ppe3_3.beans.Utilisateur;
import com.ppe3_3.dao.DAOException;
import com.ppe3_3.dao.UtilisateurDao;

public final class ConnexionForm {
    private static final String CHAMP_LOGIN      = "login";
    private static final String CHAMP_PASS       = "password";

	private String              resultat;
	private Map<String, String> erreurs          = new HashMap<String, String>();
	private UtilisateurDao      utilisateurDao;

	public ConnexionForm( UtilisateurDao utilisateurDao ) {
		this.utilisateurDao = utilisateurDao;
	}

	public Map<String, String> getErreurs() {
		return erreurs;
	}

	public String getResultat() {
		return resultat;
	}

	public Utilisateur connecterUtilisateur( HttpServletRequest request ) {
        String login = getValeurChamp( request, CHAMP_Login );
		String motDePasse = getValeurChamp( request, CHAMP_PASS );
        Boolean loginIsMail = ;

		try {
			traiterLogin( login );
			traiterMotsDePasse( motDePasse );

			if ( erreurs.isEmpty() ) {
				utilisateur = (login.matches( "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$" ) ? utilisateurDao.trouverParMail( login ) : utilisateurDao.trouverParPseudo( login ));
				resultat = "Connexion réussie, bonjour" + utilisateur.get + ".";
			} else {
				resultat = "Échec de l'inscription.";
			}
		} catch ( DAOException e ) {
			resultat = "Échec de l'inscription : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
			erreurs.put( "SQL" , "Erreur SQL" );
			e.printStackTrace();
		}

		return utilisateur;
	}

    /*
     * Appel à la validation de l'adresse email reçue et initialisation de la
     * propriété email du bean
     */
    private void traiterEmail( String email, Utilisateur utilisateur ) {
    	try {
    		validationEmail( email );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_EMAIL, e.getMessage() );
    	}
    	utilisateur.setMailU( email );
    }

    /*
     * Appel à la validation des mots de passe reçus, chiffrement du mot de
     * passe et initialisation de la propriété motDePasse du bean
     */
    private void traiterMotsDePasse( String motDePasse, String confirmation, Utilisateur utilisateur ) {
    	try {
    		validationMotsDePasse( motDePasse, confirmation );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_PASS, e.getMessage() );
    		setErreur( CHAMP_CONF, null );
    	}

        /*
         * Utilisation de la bibliothèque Jasypt pour chiffrer le mot de passe
         * efficacement.
         * 
         * L'algorithme SHA-256 est ici utilisé, avec par défaut un salage
         * aléatoire et un grand nombre d'itérations de la fonction de hashage.
         * 
         * La String retournée est de longueur 56 et contient le hash en Base64.
         */
        ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
        passwordEncryptor.setAlgorithm( ALGO_CHIFFREMENT );
        passwordEncryptor.setPlainDigest( false );
        String motDePasseChiffre = passwordEncryptor.encryptPassword( motDePasse );

        utilisateur.setMdpU( motDePasseChiffre );
    }

    /*
     * Appel à la validation du pseudo reçu et initialisation de la propriété pseudo
     * du bean
     */
    private void traiterPseudo( String pseudo, Utilisateur utilisateur ) {
    	try {
    		validationPseudo( pseudo );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_PSEUDO, e.getMessage() );
    	}
    	utilisateur.setPseudoU( pseudo );
    }

    /*
     * Appel à la validation du nom reçu et initialisation de la propriété nom
     * du bean
     */
    private void traiterNom( String nom, Utilisateur utilisateur ) {
    	try {
    		validationNom( nom );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_NOM, e.getMessage() );
    	}
    	utilisateur.setNomU( nom );
    }

    /*
     * Appel à la validation du prenom reçu et initialisation de la propriété prenom
     * du bean
     */
    private void traiterPrenom( String prenom, Utilisateur utilisateur ) {
    	try {
    		validationPrenom( prenom );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_PRENOM, e.getMessage() );
    	}
    	utilisateur.setPrenomU( prenom );
    }

    /*
     * Appel à la validation du numAdr reçu et initialisation de la propriété numAdr
     * du bean
     */
    private void traiterNumAdr( String numAdr, Utilisateur utilisateur ) {
    	try {
    		validationNumAdr( numAdr );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_NUMADR, e.getMessage() );
    		erreurs.put(CHAMP_ADRESSE, (erreurs.get(CHAMP_ADRESSE) == null ? "" : erreurs.get(CHAMP_ADRESSE) ) + e.getMessage() + "\n");
    	}
    	utilisateur.setNumAdrU( Integer.valueOf(numAdr) );
    }

    /*
     * Appel à la validation du nomAdr reçu et initialisation de la propriété nomAdr
     * du bean
     */
    private void traiterNomAdr( String nomAdr, Utilisateur utilisateur ) {
    	try {
    		validationNomAdr( nomAdr );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_NOMADR, e.getMessage() );
    		erreurs.put(CHAMP_ADRESSE, (erreurs.get(CHAMP_ADRESSE) == null ? "" : erreurs.get(CHAMP_ADRESSE) ) + e.getMessage() + "\n");
    	}
    	utilisateur.setNomAdrU( nomAdr );
    }

    /*
     * Appel à la validation du cp reçu et initialisation de la propriété cp
     * du bean
     */
    private void traiterCp( String cp, Utilisateur utilisateur ) {
    	try {
    		validationCp( cp );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_CP, e.getMessage() );
    		erreurs.put(CHAMP_ADRESSE, (erreurs.get(CHAMP_ADRESSE) == null ? "" : erreurs.get(CHAMP_ADRESSE) ) + e.getMessage() + "\n");
    	}
    	utilisateur.setCpU( Integer.valueOf(cp) );
    }

    /*
     * Appel à la validation du ville reçu et initialisation de la propriété ville
     * du bean
     */
    private void traiterVille( String ville, Utilisateur utilisateur ) {
    	try {
    		validationVille( ville );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_VILLE, e.getMessage() );
    		erreurs.put(CHAMP_ADRESSE, (erreurs.get(CHAMP_ADRESSE) == null ? "" : erreurs.get(CHAMP_ADRESSE) ) + e.getMessage() + "\n");
    	}
    	utilisateur.setVilleU( ville );
    }

    /*
     * Appel à la validation du type reçu et initialisation de la propriété type
     * du bean
     */
    private void traiterType( String type, Utilisateur utilisateur ) {
    	try {
    		validationType( type );
    	} catch ( FormValidationException e ) {
    		setErreur( CHAMP_TYPE, e.getMessage() );
    	}
    	utilisateur.setTypeU( type );
    }

    /* Validation de l'adresse email */
    private void validationEmail( String email ) throws FormValidationException {
    	if ( email != null ) {
    		if ( !email.matches( "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$" ) ) {
    			throw new FormValidationException( "Merci de saisir une adresse mail valide." );
    		} else if ( utilisateurDao.trouver( email ) != null ) {
    			throw new FormValidationException( "Cette adresse email est déjà utilisée, merci d'en choisir une autre." );
    		}
    	} else {
    		throw new FormValidationException( "Merci de saisir une adresse mail." );
    	}
    }

    /* Validation des mots de passe */
    private void validationMotsDePasse( String motDePasse, String confirmation ) throws FormValidationException {
    	if ( motDePasse != null && confirmation != null ) {
    		if ( !motDePasse.equals( confirmation ) ) {
    			throw new FormValidationException( "Les mots de passe entrés sont différents, merci de les saisir à nouveau." );
    		} else if ( motDePasse.length() < 6 ) {
    			throw new FormValidationException( "Les mots de passe doivent contenir au moins 6 caractères." );
    		}
    	} else {
    		throw new FormValidationException( "Merci de saisir et confirmer votre mot de passe." );
    	}
    }

    /* Validation du pseudo */
    private void validationPseudo( String pseudo ) throws FormValidationException {
    	if ( pseudo == null || pseudo.length() < 6 ) {
    		throw new FormValidationException( "Le pseudo d'utilisateur doit contenir au moins 6 caractères." );
    	}
    }

    /* Validation du nom */
    private void validationNom( String nom ) throws FormValidationException {
    	if ( nom == null || nom.length() == 0) {
    		throw new FormValidationException("Votre nom ne peut pas être vide.");
    	}
    }

    /* Validation du prenom */
    private void validationPrenom( String prenom ) throws FormValidationException {
    	if ( prenom == null || prenom.length() == 0) {
    		throw new FormValidationException("Votre prénom ne peut pas être vide.");
    	}
    }

    /* Validation du num adresse */
    private void validationNumAdr( String numAdr ) throws FormValidationException {
    	if ( numAdr == null || numAdr.length() == 0) {
    		throw new FormValidationException("Le numéro de votre adresse ne peut pas être vide.");
    	}else{
    		try{
    			Integer.valueOf(numAdr);
    		}catch ( ClassCastException e )
    		{
    			throw new FormValidationException("Veuillez rentrer un numéro d'adresse valide");
    		}
    	}
    }

    /* Validation du nom adresse */
    private void validationNomAdr( String nomAdr ) throws FormValidationException {
    	if ( nomAdr == null || nomAdr.length() == 0) {
    		throw new FormValidationException("Le nom de rue de votre adresse ne peut pas être vide.");
    	}
    }

    /* Validation du CP */
    private void validationCp( String cp ) throws FormValidationException {
    	if ( cp == null || cp.length() == 0) {
    		throw new FormValidationException("Votre code postal ne peut pas être vide.");
    	}else{
    		try{
    			Integer.valueOf(cp);
    		}catch ( ClassCastException e ) {
    			throw new FormValidationException("Veuillez rentrer un code postal valide");
    		}
    	}
    }

    /* Validation de la ville*/
    private void validationVille( String ville ) throws FormValidationException {
    	if ( ville == null || ville.length() == 0) {
    		throw new FormValidationException("La ville où vous résidez ne peut pas être vide.");
    	}
    }

    /* Validation du type */
    private void validationType( String type ) throws FormValidationException {
    	if ( type == null || type.length() == 0) {
    		throw new FormValidationException("Veuillez choisir un type (client ou réstaurant). null");
    	}else{
    		if (!type.equals("cli") && !type.equals("resto")) {
    			throw new FormValidationException("Veuillez choisir un type (client ou réstaurant).");
    		}
    	}
    }


    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
    	erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
    	String valeur = request.getParameter( nomChamp );
    	if ( valeur == null || valeur.trim().length() == 0 ) {
    		return null;
    	} else {
    		return valeur;
    	}
    }
}