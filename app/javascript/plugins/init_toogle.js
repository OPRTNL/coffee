const showElem = document.querySelector('#show')
let focusOnMarker;

const showInfoPartnerElem = (infoPartnerElem) => {
  infoPartnerElem.classList.remove("hidden")
  focusOnMarker(infoPartnerElem.dataset.partnerId)
}

const updateExtend = () => {
  if (document.querySelector('#show .info-partner:not(.hidden)') == null) {
    showElem.classList.remove("extends")
  } else {
    showElem.classList.add("extends")
  }
}

const toogle = (partnerId) => {
  const infoPartnerElem = document.querySelector(`#info-partner-${partnerId}`)
  const currentDisplay = document.querySelector('#show .info-partner:not(.hidden)')

  if (currentDisplay == null) {
    showInfoPartnerElem(infoPartnerElem)
  } else {
    currentDisplay.classList.add("hidden")
    if (partnerId != currentDisplay.dataset.partnerId) {
      showInfoPartnerElem(infoPartnerElem)
    }
  }
  updateExtend();
}

const partnerClick = (e) => {
  e.preventDefault();
  const partnerId = event.currentTarget.dataset.partnerId

  toogle(partnerId);
}


const initToogle = (focusOnMarkerCallback) => {
  focusOnMarker = focusOnMarkerCallback
  document.querySelectorAll('.show-toogle').forEach((elem) => {
    elem.addEventListener('click', partnerClick)
  })
}

export default initToogle ;

