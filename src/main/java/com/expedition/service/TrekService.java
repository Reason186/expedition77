package com.expedition.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import com.expedition.model.Trek;

public class TrekService {
    private static final List<Trek> treks = new ArrayList<>();

    static {
        treks.add(new Trek(
            "1",
            "Everest Base Camp",
            16,
            "Hard",
            5364,
            45000,
            "mounteverest.jpg",
            "Experience the world's highest peak up close.",
            "The Everest Base Camp trek is a legendary journey that takes you through the heart of the Khumbu region. Wander through Sherpa villages, explore historic monasteries, and stand in the shadow of Mount Everest. This trek offers jaw-dropping vistas, challenging suspension bridges, and a sense of absolute achievement.",
            "1 - 12 People",
            Arrays.asList("Stand at Everest Base Camp", "Hike up Kala Patthar for sunset views", "Explore the vibrant Sherpa capital of Namche Bazaar", "Visit Tengboche Monastery"),
            Arrays.asList("Fly from Kathmandu to Lukla, trek to Phakding", "Trek to Namche Bazaar", "Acclimatization day in Namche Bazaar", "Trek to Tengboche", "Trek to Dingboche", "Acclimatization day in Dingboche", "Trek to Lobuche", "Trek to Gorak Shep and hike to Everest Base Camp", "Hike Kala Patthar, trek down to Pheriche", "Trek back to Namche", "Trek back to Lukla", "Fly back to Kathmandu")
        ));

        treks.add(new Trek(
            "2",
            "Annapurna Circuit",
            21,
            "Moderate",
            5416,
            35000,
            "annapurna.jpg",
            "Nepal's most diverse and beautiful trekking route.",
            "The Annapurna Circuit is famed for its spectacular variety of landscapes, ranging from lush subtropical valleys and terraced fields to the high-altitude desert of Mustang. Crossing the challenging Thorong La Pass at 5,416m is a highlight that rewards you with panoramic mountain views of the Annapurnas, Dhaulagiri, and Manaslu.",
            "2 - 15 People",
            Arrays.asList("Cross the Thorong La Pass (5,416m)", "Visit the sacred Muktinath Temple", "Stunning views of Annapurna and Dhaulagiri ranges", "Explore Kali Gandaki Gorge"),
            Arrays.asList("Drive from Kathmandu to Besisahar, trek to Bhulbhule", "Trek to Chamje", "Trek to Bagarchhap", "Trek to Chame", "Trek to Pisang", "Trek to Manang", "Acclimatization day in Manang", "Trek to Yak Kharka", "Trek to Thorong Phedi", "Cross Thorong La Pass, trek to Muktinath", "Trek to Jomsom", "Trek to Tatopani", "Trek to Ghorepani", "Hike Poon Hill, trek to Nayapul and drive to Pokhara", "Drive back to Kathmandu")
        ));

        treks.add(new Trek(
            "3",
            "Langtang Valley",
            10,
            "Easy",
            3870,
            25000,
            "langtang.jpg",
            "Scenic valley trek just a day's drive from Kathmandu.",
            "The Langtang Valley trek, also known as the valley of glaciers, offers pristine forests, wildlife, alpine meadows, and traditional Tamang villages. It is the perfect trek for those looking for a shorter, less crowded, yet incredibly scenic Himalayan adventure close to Kathmandu.",
            "1 - 10 People",
            Arrays.asList("Stunning views of Langtang Lirung", "Visit the cheese factory in Kyanjin Gompa", "Hike up Kyanjin Ri or Tsergo Ri", "Experience rich Tamang culture"),
            Arrays.asList("Drive from Kathmandu to Syabrubesi", "Trek to Lama Hotel", "Trek to Langtang Village", "Trek to Kyanjin Gompa", "Exploration day around Kyanjin Gompa", "Trek back to Lama Hotel", "Trek back to Syabrubesi", "Drive back to Kathmandu")
        ));
    }

    public List<Trek> getAllTreks() {
        List<Trek> merged = new ArrayList<>(treks);
        try {
            com.expedition.dao.CustomTrekDAO dao = new com.expedition.dao.CustomTrekDAO();
            List<java.util.Map<String, Object>> customList = dao.getAllCustomTreks();
            if (customList != null) {
                for (java.util.Map<String, Object> map : customList) {
                    Trek t = mapToTrek(map);
                    if (t != null) {
                        merged.add(t);
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("Error blending custom treks: " + e.getMessage());
            e.printStackTrace();
        }
        return merged;
    }

    public Trek getTrekById(String id) {
        if (id == null) return null;
        
        if (id.startsWith("custom_")) {
            try {
                String numStr = id.substring("custom_".length());
                int dbId = Integer.parseInt(numStr);
                com.expedition.dao.CustomTrekDAO dao = new com.expedition.dao.CustomTrekDAO();
                java.util.Map<String, Object> map = dao.getCustomTrekById(dbId);
                return mapToTrek(map);
            } catch (Exception e) {
                System.err.println("Error fetching custom trek by id: " + e.getMessage());
                e.printStackTrace();
                return null;
            }
        }
        
        for (Trek t : treks) {
            if (t.getTrekId().equals(id)) {
                return t;
            }
        }
        return null;
    }

    private Trek mapToTrek(java.util.Map<String, Object> map) {
        if (map == null) return null;
        
        String idStr = "custom_" + map.get("id");
        String name = (String) map.get("name");
        int duration = (Integer) map.get("duration");
        String difficulty = (String) map.get("difficulty");
        int maxAltitude = (Integer) map.get("max_altitude");
        int price = (Integer) map.get("price");
        
        String image = (String) map.get("image");
        if (image == null || image.trim().isEmpty()) {
            image = "annapurna.jpg"; // Default premium image
        }
        String image2 = (String) map.get("image2");
        if (image2 == null || image2.trim().isEmpty()) {
            image2 = "mounteverest.jpg";
        }
        String image3 = (String) map.get("image3");
        if (image3 == null || image3.trim().isEmpty()) {
            image3 = "langtang.jpg";
        }
        
        String shortDesc = (String) map.get("short_description");
        String longDesc = (String) map.get("long_description");
        String groupSize = (String) map.get("group_size");
        if (groupSize == null || groupSize.trim().isEmpty()) {
            groupSize = "1 - 10 People";
        }
        
        String guideName = (String) map.get("guide_name");
        if (guideName == null) {
            guideName = "Certified Guide";
        }
        
        List<String> highlights = Arrays.asList(
            "Guided by certified specialist: " + guideName,
            "Custom-tailored mountain navigation and safety support",
            "Flexible pace designed for high-altitude acclimatization",
            "Authentic local tea house cultural experiences"
        );
        
        List<String> itinerary = new ArrayList<>();
        itinerary.add("Arrival, gear verification, and detailed briefing with guide " + guideName);
        if (duration > 2) {
            for (int i = 2; i < duration; i++) {
                itinerary.add("Day " + i + " of custom trekking route: explore breathtaking high-altitude trails");
            }
        }
        if (duration > 1) {
            itinerary.add("Final descent, celebratory dinner with your guide, and departure");
        }
        
        Trek t = new Trek(
            idStr,
            name,
            duration,
            difficulty,
            maxAltitude,
            price,
            image,
            shortDesc,
            longDesc,
            groupSize,
            highlights,
            itinerary
        );
        t.setImages(Arrays.asList(image, image2, image3));
        return t;
    }

    public List<String> getFeaturedTreks() {
        return Arrays.asList("1", "2", "3");
    }
}
