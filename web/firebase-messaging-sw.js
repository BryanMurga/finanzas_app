importScripts('https://www.gstatic.com/firebasejs/10.3.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/10.3.0/firebase-messaging.js');

firebase.initializeApp({
  apiKey: "AlzaSyBTfjoYLO1WklMd7YHhGrsEV_heF14q3pk",
  authDomain: "restaurantec-47f78.firebaseapp.com",
  projectId: "restaurantec-47f78",
  storageBucket: "restaurantec-47f78.appspot.com",
  messagingSenderId: "126279978788",
  appId: "1:126279978788:android:a1d56bc5bea8be1407edb1"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
    console.log('Mensaje en segundo plano:', payload);
    const notificationTitle = payload.notification.title;
    const notificationOptions = {
        body: payload.notification.body,
        icon: payload.notification.icon,
    };

    return self.registration.showNotification(notificationTitle, notificationOptions);
});
