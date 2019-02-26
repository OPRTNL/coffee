import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('partner_adress');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export default initAutocomplete ;
