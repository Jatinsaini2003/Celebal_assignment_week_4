SELECT
  CASE WHEN G.grade >= 8 THEN S.name ELSE NULL END AS Name,
  G.grade AS Grade,
  S.marks AS Mark
FROM Students S
JOIN Grades G
  ON S.marks BETWEEN G.min_mark AND G.max_mark
ORDER BY
  G.grade DESC,
  CASE WHEN G.grade >= 8 THEN S.name END ASC,
  CASE WHEN G.grade < 8 THEN S.marks END ASC;
