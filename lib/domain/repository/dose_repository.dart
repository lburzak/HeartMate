abstract class DoseRepository {
  void insertDoseTaken(DateTime dateTime, double potency);

  void removeDoseFromDay(DateTime dateTime);
}
