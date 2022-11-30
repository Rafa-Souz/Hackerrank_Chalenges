SELECT CONVERT(DECIMAL(7,4), SQRT(POWER((MIN(long_W) - MAX(long_W)),2) + POWER((MIN(lat_N) - MAX(lat_N)),2)))
FROM station