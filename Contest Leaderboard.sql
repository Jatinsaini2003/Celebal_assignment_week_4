SELECT
  h.hacker_id,
  h.name,
  SUM(st.max_score) AS total_score
FROM Hackers AS h
JOIN (
  SELECT
    hacker_id,
    challenge_id,
    MAX(score) AS max_score
  FROM Submissions
  GROUP BY hacker_id, challenge_id
) AS st
  ON h.hacker_id = st.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, h.hacker_id ASC;
