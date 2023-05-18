// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics"
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyBfOAoN4ktKLMI_XWVAqJ3xjmLMp3u6qnY",
  authDomain: "dongphuc-985eb.firebaseapp.com",
  projectId: "dongphuc-985eb",
  storageBucket: "dongphuc-985eb.appspot.com",
  messagingSenderId: "206212085354",
  appId: "1:206212085354:web:e7f28c87fa6ccbd413bc13",
  measurementId: "G-18GRCD5Y9D"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
import {getStorage} from "firebase/storage";
const storage = getStorage(app);
// const fb = firebase.initializeApp(config);

// const db = firebase.firestore();

export { app,storage }
