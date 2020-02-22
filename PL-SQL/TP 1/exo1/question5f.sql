
SELECT AVG(hours_difference) Moyenne_heure, STDDEV(hours_difference) ecart_type_heure
FROM (
    SELECT interval_difference, (sysdate + (interval_difference * 86400) - sysdate)/60/60 as hours_difference
    FROM (
        SELECT (heurearr - heuredep) as  interval_difference
        FROM trajet
    )
);