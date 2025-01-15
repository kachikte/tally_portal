abstract class NotificationInterface {

  sendNotificationToAdmin({required String title, required String body});

  sendBroadcastNotification({required String title, required String body});

  sendToSpecificUser({required String title, required String body});

  sendToSpecificUserName(
      {required String title,
        required String body,
        required String username});


  createNotification({required String notificationTitle,
    required String notificationBody});

  getNotifications({required String username});

  updateNotification({required String notificationId});

  deleteNotification({required String notificationId});

}