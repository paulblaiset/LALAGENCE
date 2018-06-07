import "bootstrap";

import "../plugins/flatpickr";
import "../components/carousel_home";
import "../components/gallery";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { fileUpload } from '../components/formupload';
import { setFilenames } from '../components/set_filenames';

initUpdateNavbarOnScroll();
fileUpload();
setFilenames();

