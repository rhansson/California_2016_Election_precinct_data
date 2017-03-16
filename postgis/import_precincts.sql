-- Define table then Import csv file:
--
DROP TABLE IF EXISTS precinct_results;
CREATE TABLE precinct_results  (
  pct16 character varying PRIMARY KEY NOT NULL,
  pres_clinton real DEFAULT (0),
  pres_trump real DEFAULT (0),
  pres_johnson real DEFAULT (0),
  pres_stein real DEFAULT (0),
  pres_lariva real DEFAULT (0),
  pres_other real DEFAULT (0),
  ussenate_harris real DEFAULT (0),
  ussenate_sanchez real DEFAULT (0),
  prop51_yes real DEFAULT (0),
  prop51_no real DEFAULT (0),
  prop52_yes real DEFAULT (0),
  prop52_no real DEFAULT (0),
  prop53_yes real DEFAULT (0),
  prop53_no real DEFAULT (0),
  prop54_yes real DEFAULT (0),
  prop54_no real DEFAULT (0),
  prop55_yes real DEFAULT (0),
  prop55_no real DEFAULT (0),
  prop56_yes real DEFAULT (0),
  prop56_no real DEFAULT (0),
  prop57_yes real DEFAULT (0),
  prop57_no real DEFAULT (0),
  prop58_yes real DEFAULT (0),
  prop58_no real DEFAULT (0),
  prop59_yes real DEFAULT (0),
  prop59_no real DEFAULT (0),
  prop60_yes real DEFAULT (0),
  prop60_no real DEFAULT (0),
  prop61_yes real DEFAULT (0),
  prop61_no real DEFAULT (0),
  prop62_yes real DEFAULT (0),
  prop62_no real DEFAULT (0),
  prop63_yes real DEFAULT (0),
  prop63_no real DEFAULT (0),
  prop64_yes real DEFAULT (0),
  prop64_no real DEFAULT (0),
  prop65_yes real DEFAULT (0),
  prop65_no real DEFAULT (0),
  prop66_yes real DEFAULT (0),
  prop66_no real DEFAULT (0),
  prop67_yes real DEFAULT (0),
  prop67_no real DEFAULT (0),
  pres_clinton_per real DEFAULT (0),
  pres_trump_per real DEFAULT (0),
  pres_third_per real DEFAULT (0),
  pres_winner character varying NOT NULL,
  pres_margin real DEFAULT (0),
  votedensity real DEFAULT (0),
  prop51_yes_per real DEFAULT (0),
  prop51_no_per real DEFAULT (0),
  prop52_yes_per real DEFAULT (0),
  prop52_no_per real DEFAULT (0),
  prop53_yes_per real DEFAULT (0),
  prop53_no_per real DEFAULT (0),
  prop54_yes_per real DEFAULT (0),
  prop54_no_per real DEFAULT (0),
  prop55_yes_per real DEFAULT (0),
  prop55_no_per real DEFAULT (0),
  prop56_yes_per real DEFAULT (0),
  prop56_no_per real DEFAULT (0),
  prop57_yes_per real DEFAULT (0),
  prop57_no_per real DEFAULT (0),
  prop58_yes_per real DEFAULT (0),
  prop58_no_per real DEFAULT (0),
  prop59_yes_per real DEFAULT (0),
  prop59_no_per real DEFAULT (0),
  prop60_yes_per real DEFAULT (0),
  prop60_no_per real DEFAULT (0),
  prop61_yes_per real DEFAULT (0),
  prop61_no_per real DEFAULT (0),
  prop62_yes_per real DEFAULT (0),
  prop62_no_per real DEFAULT (0),
  prop63_yes_per real DEFAULT (0),
  prop63_no_per real DEFAULT (0),
  prop64_yes_per real DEFAULT (0),
  prop64_no_per real DEFAULT (0),
  prop65_yes_per real DEFAULT (0),
  prop65_no_per real DEFAULT (0),
  prop66_yes_per real DEFAULT (0),
  prop66_no_per real DEFAULT (0),
  prop67_yes_per real DEFAULT (0),
  prop67_no_per real DEFAULT (0)
);

\COPY precinct_results FROM all_precinct_results2.csv DELIMITER ',' CSV HEADER

-- votes are integers
ALTER TABLE precinct_results ALTER COLUMN pres_clinton TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN pres_trump TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN pres_johnson TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN pres_stein TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN pres_lariva TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN pres_other TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN ussenate_harris TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN ussenate_sanchez TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop51_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop51_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop52_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop52_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop53_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop53_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop54_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop54_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop55_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop55_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop56_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop56_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop57_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop57_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop58_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop58_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop59_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop59_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop60_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop60_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop61_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop61_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop62_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop62_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop63_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop63_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop64_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop64_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop65_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop65_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop66_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop66_no TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop67_yes TYPE smallint;
ALTER TABLE precinct_results ALTER COLUMN prop67_no TYPE smallint;

