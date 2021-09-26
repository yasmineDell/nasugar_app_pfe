// Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  var firebaseConfig = {
    apiKey: "AIzaSyDPVIEZnnWIRX0fCOa6I2Cdv_ecQDIQYqY",
    authDomain: "myfb-f304c.firebaseapp.com",
    projectId: "myfb-f304c",
    storageBucket: "myfb-f304c.appspot.com",
    messagingSenderId: "136371102543",
    appId: "1:136371102543:web:8a4847f99fdea7a1cadb3a",
    measurementId: "G-CN89WMMXS9"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();




  const db = firebase.firestore();




  const form = document.querySelector('#add-pat-form');

 // saving data
 form.addEventListener('submit', (e) => {
    e.preventDefault();
    db.collection('Patient').add({
                Name: form.name.value,
                NumTel: form.numTel.value,
                DateNais: form.dateN.value,
                Email: form.emailP.value,
                NumTel: form.adressP.value,
                     
        });
           form.name.value = '';
           form.emailP.value = '';
           form.dateN.value = '';
           form.numTel.value = '';
           form.adressP.value = '';
          
});
