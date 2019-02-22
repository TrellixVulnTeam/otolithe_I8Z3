<script>
$(document).ready(function() {
$(".auto").change( function () {
	$("#searchBox").submit() ;
});
/* Recherche des lecteurs correspondant a l'experimentation */


});
</script>


<form id="searchBox" method="GET" action="index.php" class="form-horizontal protoform" >
	<input type="hidden" name="module" value="{$modulePostSearch}">
	<input type="hidden" name="isSearch" value="1">
	<div class="form-group">
		<label for="codeindividu" class="control-label col-sm-2">
		{t}Code ou TAG de l'individu :{/t}
		</label>
		<div class="col-sm-10">
			<input class="form-control" name="codeindividu" id="codeindividu" value="{$individuSearch.codeindividu}" autofocus>
		</div>
	</div>
	<div class="form-group">
		<label for="sexe" class="control-label col-sm-2">
		{t}Sexe de l'animal :{/t}
		</label>
		<div class="col-sm-4">
			<select class="auto form-control" name="sexe" id="sexe">
				<option value="">{t}Sélectionnez le sexe recherché{/t}</option>
				{section name="lst" loop=$sexe}
					<option value="{$sexe[lst].sexe_id}" {if $sexe[lst].sexe_id == $individuSearch.sexe}selected{/if}>
					{$sexe[lst].sexe_libelle}
					</option>
				{/section}
			</select>
		</div>
		<label for="exp_id" class="control-label col-sm-2">
		{t}Expérimentation :{/t}
		</label>
		<div class="col-sm-4">
			<select class="auto form-control" name="exp_id" id="exp_id">
				{section name="lst" loop=$experimentation}
				<option value="{$experimentation[lst].exp_id}" {if $experimentation[lst].exp_id == $individuSearch.exp_id}selected{/if}>
				{$experimentation[lst].exp_nom}
				</option>
				{/section}
			</select>
		</div>
	</div>
	<div class="form-group">
		<label for="site" class="control-label col-sm-2">
		{t}Site de pêche :{/t}
		</label>
		<div class="col-sm-4">
			<select class="auto form-control combobox" id="site" name="site">
				<option value="">{t}Sélectionnez le site global de pêche{/t}</option>
				{section name="lst" loop=$site}
					<option value="{$site[lst].site}" {if $site[lst].site == $individuSearch.site}selected{/if}>
					{$site[lst].site}
					</option>
				{/section}
			</select>
		</div>
		<label for="zone" class="control-label col-sm-2">
		{t}Zone précise de pêche :{/t}
		</label>
		<div class="col-sm-4">
			<select class="auto form-control combobox" name="zone" id="zone">
				<option value="">{t}Sélectionnez le site précis de pêche{/t}</option>
				{section name="lst" loop=$zone}
					<option value="{$zone[lst].zonesite}" {if $zone[lst].zonesite == $individuSearch.zone}selected{/if}>
					{$zone[lst].zonesite}
					</option>
				{/section}
			</select>
		</div>
	</div>
	<div class="form-group">
		<label for="isNotRead" class="control-label col-sm-2">
		{t}Lectures non réalisées :{/t}
		</label>
		<div class="col-sm-1" id="isNotRead">
			<input type="radio" name="isNotRead" value="0" {if $individuSearch.isNotRead == 0}checked{/if}>{t}non{/t}
			<input type="radio" name="isNotRead" value="1" {if $individuSearch.isNotRead == 1}checked{/if}>{t}oui{/t}
		</div>
		<label for="lecteur_id" class="control-label col-sm-1">
			{t}pour :{/t}
		</label>
		<div class="col-sm-2">
			<select class="form-control" id="lecteur_id" name="lecteur_id">
			</select>
		</div>
		<div class="col-sm-4"></div>
		<div class="col-sm-2 center">
			<button class="btn btn-success" type="submit">{t}Rechercher...{/t}</button> 
		</div>
	</div>
</form>
