SELECT ROUND(AVG(DISTINCT s.LAT_N), 4) AS median_lat_n
FROM STATION AS s
JOIN (
  SELECT COUNT(*) AS total FROM STATION
) AS t
WHERE 
  t.total <= 2 * (SELECT COUNT(*) FROM STATION AS s1 WHERE s1.LAT_N <= s.LAT_N)
  AND t.total <= 2 * (SELECT COUNT(*) FROM STATION AS s2 WHERE s2.LAT_N >= s.LAT_N);
