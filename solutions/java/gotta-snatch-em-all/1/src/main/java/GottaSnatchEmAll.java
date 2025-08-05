import java.util.List;
import java.util.Set;
import java.util.HashSet;

class GottaSnatchEmAll {

    static Set<String> newCollection(List<String> cards) {
        return new HashSet<String>(cards);
    }

    static boolean addCard(String card, Set<String> collection) {
        return collection.add(card);
    }

    static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
       boolean myCol = myCollection.stream().anyMatch(card -> !theirCollection.contains(card));
        boolean thCol = theirCollection.stream().anyMatch(card -> !myCollection.contains(card));

        return myCol && thCol;
    }

    static Set<String> commonCards(List<Set<String>> collections) {
        Set<String> firstData = new HashSet<String>(collections.get(0));
        
        collections.forEach(collection -> {
           firstData.retainAll(collection); 
        });

        return firstData;
    }

    static Set<String> allCards(List<Set<String>> collections) {
        Set<String> colSet = new HashSet<String>();
        
        collections.forEach(collection -> {
            colSet.addAll(collection);    
        });

        return colSet;
    }
}
