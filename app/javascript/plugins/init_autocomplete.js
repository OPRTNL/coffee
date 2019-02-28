import places from 'places.js';

const initAutocomplete = () => {
if (document.getElementById('partner_address') !== null) {
  const addressInput = document.getElementById('partner_address');
  places({ container: addressInput, style: true });
} else  if (document.getElementById('input-algo') !== null) {
  const addressInput = document.getElementById('input-algo');
  places({ container: addressInput, style: true });
};
};

export default initAutocomplete ;
