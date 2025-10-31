// Import Firebase SDKs
importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging-compat.js');

// Firebase config - DÙNG CÙNG CONFIG VỚI FLUTTER WEB
firebase.initializeApp({
  apiKey: "AIzaSyBcUwvAa3TBikqCC3-njyhdrssm1ed_10I",
  authDomain: "flutter-notifications-de-599c2.firebaseapp.com",
  projectId: "flutter-notifications-de-599c2",
  storageBucket: "flutter-notifications-de-599c2.firebasestorage.app",
  messagingSenderId: "150412332827",
  appId: "1:150412332827:web:6880d8fe7346a51e958dbe"
});

const messaging = firebase.messaging();

// Xử lý background messages
messaging.onBackgroundMessage((payload) => {
  console.log('[firebase-messaging-sw.js] 📨 Received background message:', payload);

  const notificationTitle = payload.notification?.title || 'New Notification';
  const notificationOptions = {
    body: payload.notification?.body,
    icon: '/icons/icon-192.png',
    badge: '/icons/icon-72.png',
    data: payload.data || {} // Truyền data để xử lý khi click
  };

  // Hiển thị notification
  return self.registration.showNotification(notificationTitle, notificationOptions);
});

// Xử lý khi notification được click
self.addEventListener('notificationclick', (event) => {
  console.log('🔔 Notification clicked:', event.notification);
  
  event.notification.close();
  
  // Mở app hoặc tab mới khi click notification
  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then((clientList) => {
      // Đã có tab mở -> focus vào tab đó
      for (const client of clientList) {
        if (client.url === self.location.origin && 'focus' in client) {
          return client.focus();
        }
      }
      // Chưa có tab mở -> mở tab mới
      if (clients.openWindow) {
        return clients.openWindow(self.location.origin);
      }
    })
  );
});