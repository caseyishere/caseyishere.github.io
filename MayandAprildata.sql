-- April summary
WITH april_summary AS (
  SELECT
    member_casual,
    rideable_type,
    FORMAT_TIMESTAMP('%A', TIMESTAMP(started_at)) AS day_of_week,
    COUNT(*) AS april_ride_count,
    ROUND(AVG(TIME_DIFF(SAFE.PARSE_TIME('%T', ride_length), TIME '00:00:00', SECOND)) / 60, 2) AS april_avg_minutes
  FROM
    anotherfile.May_and_april_data.april
  GROUP BY member_casual, rideable_type, day_of_week
),

-- May summary
may_summary AS (
  SELECT
    member_casual,
    rideable_type,
    FORMAT_TIMESTAMP('%A', TIMESTAMP(started_at)) AS day_of_week,
    COUNT(*) AS may_ride_count,
    ROUND(AVG(TIME_DIFF(SAFE.PARSE_TIME('%T', ride_length), TIME '00:00:00', SECOND)) / 60, 2) AS may_avg_minutes
  FROM
    anotherfile.May_and_april_data.May
  GROUP BY member_casual, rideable_type, day_of_week
),

-- Combined summary
joined_summary AS (
  SELECT
    COALESCE(a.member_casual, m.member_casual) AS member_casual,
    COALESCE(a.rideable_type, m.rideable_type) AS rideable_type,
    COALESCE(a.day_of_week, m.day_of_week) AS day_of_week,
    a.april_ride_count,
    m.may_ride_count,
    a.april_avg_minutes,
    m.may_avg_minutes,
    ROUND(
      SAFE_DIVIDE((m.may_avg_minutes - a.april_avg_minutes), a.april_avg_minutes) * 100,
      2
    ) AS percent_difference
  FROM april_summary a
  FULL OUTER JOIN may_summary m
    ON a.member_casual = m.member_casual
    AND a.rideable_type = m.rideable_type
    AND a.day_of_week = m.day_of_week
),

-- Grand Totals by rideable_type
grand_totals AS (
  SELECT
    'ALL' AS member_casual,
    rideable_type,
    'ALL' AS day_of_week,
    COUNT(IF(month = 'April', 1, NULL)) AS april_ride_count,
    COUNT(IF(month = 'May', 1, NULL)) AS may_ride_count,
    ROUND(AVG(IF(month = 'April', ride_minutes, NULL)), 2) AS april_avg_minutes,
    ROUND(AVG(IF(month = 'May', ride_minutes, NULL)), 2) AS may_avg_minutes,
    ROUND(
      SAFE_DIVIDE(
        AVG(IF(month = 'May', ride_minutes, NULL)) -
        AVG(IF(month = 'April', ride_minutes, NULL)),
        AVG(IF(month = 'April', ride_minutes, NULL))
      ) * 100,
      2
    ) AS percent_difference
  FROM (
    SELECT
      'April' AS month,
      rideable_type,
      TIME_DIFF(SAFE.PARSE_TIME('%T', ride_length), TIME '00:00:00', SECOND) / 60.0 AS ride_minutes
    FROM anotherfile.May_and_april_data.april

    UNION ALL

    SELECT
      'May' AS month,
      rideable_type,
      TIME_DIFF(SAFE.PARSE_TIME('%T', ride_length), TIME '00:00:00', SECOND) / 60.0 AS ride_minutes
    FROM anotherfile.May_and_april_data.May
  )
  GROUP BY rideable_type
)

-- Final output
SELECT * FROM joined_summary
UNION ALL
SELECT * FROM grand_totals
