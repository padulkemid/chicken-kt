import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

class AppointmentScheduler {
    public LocalDateTime schedule(String appointmentDateDescription) {
        DateTimeFormatter parser = DateTimeFormatter.ofPattern("M/dd/yyyy HH:mm:ss");
        return LocalDateTime.parse(appointmentDateDescription, parser);
    }

    public boolean hasPassed(LocalDateTime appointmentDate) {
        return appointmentDate.isBefore(LocalDateTime.now());
    }

    public boolean isAfternoonAppointment(LocalDateTime appointmentDate) {
        return appointmentDate.getHour() >= 12 && appointmentDate.getHour() < 18;
    }

    public String getDescription(LocalDateTime appointmentDate) {
        DateTimeFormatter parseHour = DateTimeFormatter.ofPattern("h:mm a");
        return "You have an appointment on " + appointmentDate.format(DateTimeFormatter.ofPattern("EEEE")) + ", " + appointmentDate.format(DateTimeFormatter.ofPattern("MMMM")) + " " + appointmentDate.getDayOfMonth() + ", " + appointmentDate.getYear() + ", at " + appointmentDate.format(parseHour) + ".";
    }

    public LocalDate getAnniversaryDate() {
        return LocalDateTime.of(LocalDateTime.now().getYear(), 9, 15, 0, 0).toLocalDate();
    }
}
