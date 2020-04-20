<?php

require_once "DataHandler.php";

class ExampleModel {

    public function __construct() {
        $this->dataHandler = new DataHandler(DB_HOST, DB_DB, DB_USERNAME, DB_PASSWORD);
    }

    // example
    public function suggest($year_start, $year_end, $gen_id, $rating, $keywords) {
        return $this->dataHandler->readData(
            "SELECT mov_title as 'title', mov_year as 'year', gen_title as 'genre', rev_stars as 'stars' FROM movie NATURAL JOIN movie_genres NATURAL JOIN genres NATURAL LEFT JOIN rating WHERE gen_id = :gen_id AND mov_title LIKE :keywords AND rev_stars >= :rating AND mov_year BETWEEN :year_start AND :year_end",
            [
                ":year_start" => $year_start,
                ":year_end" => $year_end,
                ":gen_id" => $gen_id,
                ":rating" => $rating,
                ":keywords" => $keywords,
            ]
        );
    }

}