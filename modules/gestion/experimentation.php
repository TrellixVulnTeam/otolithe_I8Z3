<?php
/**
 * Created : 14 févr. 2017
 * Creator : quinton
 * Encoding : UTF-8
 * Copyright 2017 - All rights reserved
 */
require_once 'modules/classes/individu.class.php';
$dataClass = new Experimentation($bdd, $ObjetBDDParam);
$id = $_REQUEST["exp_id"];

switch ($t_module["param"]) {
    case "list":
		/*
		 * Display the list of all records of the table
		 */
	    $vue->set($dataClass->getListe(), "data");
        $vue->set("gestion/experimentationList.tpl", "corps");

        break;

    case "change":
		/*
		 * open the form to modify the record
		 * If is a new record, generate a new record with default value :
		 * $_REQUEST["idParent"] contains the identifiant of the parent record
		 */
		dataRead($dataClass, $id, "gestion/experimentationChange.tpl");
        break;
    case "write":
		/*
		 * write record in database
		 */
	    try {
            dataWrite($dataClass, $_REQUEST);
            /*
             * Rechargement des experimentations autorisees pour l'operateur apres modification
             */
            require_once 'modules/classes/photo.class.php';
            $lecteur = new Lecteur($bdd, $ObjetBDDParam);
            $lecteur_id = $lecteur->getIdFromLogin($_SESSION['login']);
            if ($lecteur_id > 0) {
                require_once 'modules/classes/individu.class.php';
                $experimentation = new Experimentation($bdd, $ObjetBDDParam);
                $_SESSION["experimentations"] = $experimentation->getExpAutorisees($lecteur_id);
            }
        } catch (Exception $e) {}

        break;
    case "delete":
		/*
		 * delete record
		 */
		dataDelete($dataClass, $id);
        break;
}
?>