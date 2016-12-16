package com.ppe3_3.beans;

import java.sql.Timestamp;

public class Utilisateur { /// modif by clement pour colle avec la bdd


	private String    mailU;

	private String    pseudoU;

	private String    nomU;

	private String		prenomU;

	private int numAdrU;

	private String nomAdrU;

	private int cpU;

	private String villeU;

	private String mdpU;

	private String typeU;


	private Timestamp dateInscription; // --->  jai laissé le getter et setter 



	public String getMailU() {
		return mailU;
	}

	public void setMailU(String mailU) {
		this.mailU = mailU;
	}

	public String getPseudoU() {
		return pseudoU;
	}

	public void setPseudoU(String pseudoU) {
		this.pseudoU = pseudoU;
	}

	public String getNomU() {
		return nomU;
	}

	public void setNomU(String nomU) {
		this.nomU = nomU;
	}

	public String getPrenomU() {
		return prenomU;
	}

	public void setPrenomU(String prenomU) {
		this.prenomU = prenomU;
	}

	public int getNumAdrU() {
		return numAdrU;
	}

	public void setNumAdrU(int numAdrU) {
		this.numAdrU = numAdrU;
	}

	public String getNomAdrU() {
		return nomAdrU;
	}

	public void setNomAdrU(String nomAdrU) {
		this.nomAdrU = nomAdrU;
	}

	public int getCpU() {
		return cpU;
	}

	public void setCpU(int cpU) {
		this.cpU = cpU;
	}

	public String getVilleU() {
		return villeU;
	}

	public void setVilleU(String villeU) {
		this.villeU = villeU;
	}

	public String getMdpU() {
		return mdpU;
	}

	public void setMdpU(String mdpU) {
		this.mdpU = mdpU;
	}

	public String getTypeU() {
		return typeU;
	}

	public void setTypeU(String typeU) {
		this.typeU = typeU;
	}

	public Timestamp getDateInscription() {
		return dateInscription;
	}

	public void setDateInscription(Timestamp dateInscription) {
		this.dateInscription = dateInscription;
	}
}