use chrono::prelude::*;
use polars::prelude::*;
use std::fs::File;

fn main() {
    let mut df: DataFrame = df!(
        "name" => ["Alice Archer", "Ben Brown", "Chloe Cooper", "Daniel Donovan"],
        "birthdate" => [
            NaiveDate::from_ymd_opt(1997, 1, 10).unwrap(),
            NaiveDate::from_ymd_opt(1985, 2, 15).unwrap(),
            NaiveDate::from_ymd_opt(1983, 3, 22).unwrap(),
            NaiveDate::from_ymd_opt(1981, 4, 30).unwrap(),
        ],
        "weight" => [57.9, 72.5, 53.6, 83.1],
        "height" => [1.56, 1.77, 1.65, 1.75],
    )
    .expect("Could not create basic DataFrame");

    let mut file = File::create("examples/output.csv").expect("could not create file");

    CsvWriter::new(&mut file)
        .include_header(true)
        .with_separator(b',')
        .finish(&mut df)
        .expect("needed to write and could not for some reason");
    let csv_read_options = CsvReadOptions::default()
        .with_infer_schema_length(None)
        .with_has_header(true)
        .with_parse_options(CsvParseOptions::default().with_try_parse_dates(true));

    let df_csv = csv_read_options
        .try_into_reader_with_file_path(Some("examples/output.csv".into()))
        .expect("CsvReader could not be extracted.")
        .finish()
        .expect("Could not read csv into polars DataFrame");
    
    println!("{}", df_csv);
}
