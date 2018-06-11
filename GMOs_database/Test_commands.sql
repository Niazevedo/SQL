use gmos;

# Select the name of the variant of the modified species and all the information of the specie for species with common name "rice"

SELECT em.`nome variante`, e.* FROM `espécie modificada` em INNER JOIN espécie e
ON em.Espécie_Espécie_ID=e.Espécie_ID WHERE `Nome Comum`='rice';

 # Select the country that has both approval and not approval.

SELECT País_Nome FROM (aprovação a INNER JOIN país p ON a.País_País_ID=p.País_ID)
 INNER JOIN `não aprovação` na ON p.País_ID= na.País_País_ID
 WHERE a.País_País_ID IS NOT NULL AND na.País_País_ID IS NOT NULL;

#All the papers and name of the variant of approved species.

SELECT ap.Artigo, em.`Nome Variante` FROM (`artigos publicados` ap INNER JOIN `espécie modificada` em
ON ap.`Espécie Modificada_Espécie Modificada_ID`= em.`Espécie Modificada_ID`) INNER JOIN aprovação a 
ON em.`Espécie Modificada_ID`= a.`Espécie Modificada_Espécie Modificada_ID`;

# Select the name of the variant, the function and the reasons of non approval.

SELECT em.`nome variante`,t.Função, na.Razões FROM (`não aprovação` na INNER JOIN `espécie modificada` em
ON na.`Espécie Modificada_Espécie Modificada_ID`= `Espécie Modificada_ID`) INNER JOIN 
(`espécie modificada_has_transgene` emt INNER JOIN transgene t ON emt.`Transgene_Transgene_ID`= t.Transgene_ID)
ON em.`Espécie Modificada_ID`= emt.`Espécie Modificada_Espécie Modificada_ID`;

# Select all the promotors of the modified species GR2 and the transgenes / original species of both that are associated.

SELECT p.`Nome_Promotor`, pr.`Espécie Origem`, t.`Abreviatura + Nome`, t.`Espécie Origem`
FROM ((`espécie modificada` em INNER JOIN `espécie modificada_has_transgene` emt ON
 em.`Espécie Modificada_ID`= emt.`Espécie Modificada_Espécie Modificada_ID`)INNER JOIN transgene t 
 ON emt.`Transgene_Transgene_ID`= t.Transgene_ID) INNER JOIN ( `transgene_has_promotor` tp INNER JOIN 
 promotor pr ON tp.`Promotor_Promotor_ID`= pr.Promotor_ID) ON t.Transgene_ID= tp.`Transgene_Transgene_ID`
 WHERE `Nome Variante`='GR2';
 
