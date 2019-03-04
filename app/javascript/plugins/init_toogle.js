const showElem = document.querySelector('#show')

const updateExtend = () => {
  if (document.querySelector('#show .info-partner:not(.hidden)') == null) {
    showElem.classList.remove("extends")
  } else {
    showElem.classList.add("extends")
  }
}

const showInfo = (partnerId) => {
  const infoPartnerElem = document.querySelector(`#info-partner-${partnerId}`)
  const currentDisplay = document.querySelector('#show .info-partner:not(.hidden)')

  if (currentDisplay == null) {
    infoPartnerElem.classList.remove("hidden")
  } else {
    currentDisplay.classList.add("hidden")
    if (partnerId != currentDisplay.dataset.partnerId) {
      infoPartnerElem.classList.remove("hidden")
    }
  }
  updateExtend();
}

const partnerClick = (e) => {
  e.preventDefault();
  const partnerId = event.currentTarget.dataset.partnerId

  showInfo(partnerId);
}


const initToogle = () => {
  document.querySelectorAll('.show-toogle').forEach((elem) => {
    elem.addEventListener('click', partnerClick)
  })
}

export default initToogle ;

