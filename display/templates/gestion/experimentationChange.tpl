<h2>Modification d'une expérimentation</h2>

<a href="index.php?module=experimentationList">Retour à la liste</a>
<table class="tablesaisie">
<form method="post" action="index.php?module=experimentationWrite">
<input type="hidden" name="action" value="M">
<input type="hidden" name="exp_id" value="{$data.exp_id}">
<tr>
<td class="libelleSaisie">Nom <span class="red">*</span> :</td>
<td class="datamodif">
<input id="exp_nom" name="exp_nom" value="{$data.exp_nom}" required></td>
</tr>
<tr>
<td class="libelleSaisie">Description :</td>
<td class="datamodif">
<input id="exp_description" name="exp_description" value="{$data.exp_description}" ></td>
</tr>
<tr>
<td class="libelleSaisie">Date de début  :</td>
<td class="datamodif">
<input id="exp_debut" name="exp_debut" value="{$data.exp_debut}" class="date">
</td>
</tr>

<tr>
<td class="libelleSaisie">Date de fin :</td>
<td class="datamodif">
<input id="exp_fin" name="exp_fin" value="{$data.exp_fin}" class="date">
</td>
</tr>

<tr>
<td colspan="2"><div align="center">
<input type="submit" value="Enregistrer">
</form>
{if $data.exp_id>0}
<form action="index.php" method="post" onSubmit='return confirmSuppression()'>
<input type="hidden" name="exp_id" value="{$data.exp_id}">
<input type="hidden" name="module" value="experimentationDelete">
<input type="submit" value="Supprimer">
</form>
{/if}
</div>
</td>
</tr>
</table>
<span class="red">*</span><span class="messagebas">Champ obligatoire</span>