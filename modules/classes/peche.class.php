<?php
/**
 * ORM de gestion de la table peche
 * @author quinton
 *
 */
class Peche extends ObjetBdd {
	function __construct($bdd, $param) {
		$this->param = $param;
		$this->table = "peche";
		$this->id_auto = 1;
		$this->colonnes = array (
				"peche_id" => array (
						"type" => 1,
						"key" => 1,
						"requis" => 1 
				),
				"site" => array (
						"longueur" => 100 
				),
				"zonesite" => array (
						"longueur" => 100 
				),
				"peche_date" => array (
						"type" => 2 
				),
				"campagne" => array (
						"longueur" => 100 
				),
				"peche_engin" => array (
						"longueur" => 100 
				),
				"personne" => array (
						"longueur" => 100 
				),
				"operateur" => array (
						"longueur" => 100 
				) 
		);
		if (! is_array ( $param ))
			$param = array ();
		$param ["fullDescription"] = 1;
		$oaram["auto_date"] = 1;
		parent::__construct ( $bdd, $param );
	}
	/**
	 * Retourne la liste des sites peches
	 * 
	 * @return array
	 */
	function getListeSite() {
		$sql = "select distinct site from " . $this->table . " 
				order by site
				";
		return $this->getListParam ( $sql );
	}
	/**
	 * Retourne la liste des zones de peche
	 * 
	 * @return array
	 */
	function getListeZone() {
		$sql = "select distinct zonesite from " . $this->table . "
				order by zonesite
				";
		return $this->getListParam ( $sql );
	}
}

?>