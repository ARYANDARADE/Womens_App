// notification_manager.dart

class NotificationManager {
  static List<String> notifications = [];

  static void addNotification(String message) {
    notifications.insert(0, message); // Add the latest notification at the beginning of the list
  }
}
