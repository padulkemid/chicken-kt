import java.util.*;

class RelativeDistance {
    private final Map<String, List<String>> adjacencyList = new HashMap<>();

    RelativeDistance(Map<String, List<String>> familyTree) {
        for (Map.Entry<String, List<String>> entry : familyTree.entrySet()) {
            String parent = entry.getKey();
            List<String> children = entry.getValue();
            for (String child : children) {
                adjacencyList.computeIfAbsent(parent, k -> new ArrayList<>()).add(child);
                adjacencyList.computeIfAbsent(child, k -> new ArrayList<>()).add(parent);
            }
        }

        for (List<String> siblings : familyTree.values()) {
            if (siblings.size() > 1) {
                for (int i = 0; i < siblings.size(); i++) {
                    for (int j = i + 1; j < siblings.size(); j++) {
                        String siblingA = siblings.get(i);
                        String siblingB = siblings.get(j);
                        
                        adjacencyList.get(siblingA).add(siblingB);
                        adjacencyList.get(siblingB).add(siblingA);
                    }
                }
            }
        }
    }

    int degreeOfSeparation(String personA, String personB) {
        if (personA.equals(personB)) {
            return 0;
        }

        Queue<Object[]> queue = new LinkedList<>();
        Set<String> visited = new HashSet<>();

        queue.add(new Object[]{personA, 0});
        visited.add(personA);

        while (!queue.isEmpty()) {
            Object[] current = queue.poll();
            String currentPerson = (String) current[0];
            int currentDistance = (int) current[1];

            if (adjacencyList.containsKey(currentPerson)) {
                for (String neighbor : adjacencyList.get(currentPerson)) {
                    if (neighbor.equals(personB)) {
                        return currentDistance + 1;
                    }
                    if (!visited.contains(neighbor)) {
                        visited.add(neighbor);
                        queue.add(new Object[]{neighbor, currentDistance + 1});
                    }
                }
            }
        }
        return -1;
    }
}