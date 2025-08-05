class Badge {
    public String print(Integer id, String name, String department) {
        StringBuilder buildBadge = new StringBuilder();

        if (id != null) buildBadge.append("[" + id + "] - ");

        buildBadge.append(name);
        
        if (department != null) {
            buildBadge.append(" - " + department.toUpperCase());
        } else {
            buildBadge.append(" - OWNER");
        }

        return buildBadge.toString();
    }
}
