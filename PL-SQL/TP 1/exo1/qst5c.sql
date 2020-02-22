SELECT *
FROM train
WHERE lieu in (
	SELECT ville
	FROM conducteur
	WHERE cnom = &nom_conducteur);