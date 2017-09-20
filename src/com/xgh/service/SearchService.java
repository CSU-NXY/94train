package com.xgh.service;

import com.nxy.model.TrainTable;

import java.util.List;

public interface SearchService {
    public List<TrainTable> getTrainsByTwoStation(String departure, String destination);
}
