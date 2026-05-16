package com.expedition.model;

import java.util.List;

public class Trek {
    private String trekId;
    private String name;
    private int duration;
    private String difficulty;
    private int maxAltitude;
    private int price;
    private String image;
    private List<String> images;
    private String shortDescription;
    private String longDescription;
    private String groupSize;
    private List<String> highlights;
    private List<String> itinerary;

    public Trek() {}

    public Trek(String trekId, String name, int duration, String difficulty, int maxAltitude, int price, String image, String shortDescription, String longDescription, String groupSize, List<String> highlights, List<String> itinerary) {
        this.trekId = trekId;
        this.name = name;
        this.duration = duration;
        this.difficulty = difficulty;
        this.maxAltitude = maxAltitude;
        this.price = price;
        this.image = image;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.groupSize = groupSize;
        this.highlights = highlights;
        this.itinerary = itinerary;
        // Guarantee at least 3 images for every static trek
        this.images = java.util.Arrays.asList(image, "annapurna.jpg", "langtang.jpg");
    }

    public String getTrekId() { return trekId; }
    public void setTrekId(String trekId) { this.trekId = trekId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }

    public int getMaxAltitude() { return maxAltitude; }
    public void setMaxAltitude(int maxAltitude) { this.maxAltitude = maxAltitude; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public String getShortDescription() { return shortDescription; }
    public void setShortDescription(String shortDescription) { this.shortDescription = shortDescription; }

    public String getLongDescription() { return longDescription; }
    public void setLongDescription(String longDescription) { this.longDescription = longDescription; }

    public String getGroupSize() { return groupSize; }
    public void setGroupSize(String groupSize) { this.groupSize = groupSize; }

    public List<String> getHighlights() { return highlights; }
    public void setHighlights(List<String> highlights) { this.highlights = highlights; }

    public List<String> getItinerary() { return itinerary; }
    public void setItinerary(List<String> itinerary) { this.itinerary = itinerary; }

    public List<String> getImages() { return images; }
    public void setImages(List<String> images) { this.images = images; }
}
