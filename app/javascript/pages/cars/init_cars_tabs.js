const myCarsTab = document.querySelector("#mycars")
const upcomingBookingsTab = document.querySelector("#my-cars-bookings")

const initCarsTabs = () => {
  const carTabsLinks = document.querySelectorAll(".cars-tab")
  bookingTabsLinks.forEach((btn) => {
    btn.addEventListener("click", (event) => {
      const ulTarget = event.target.dataset.target
      bookingTabsLinks.forEach((btn2) => {
        btn2.style.color="black"
      })
      if (ulTarget === "mycars") {
        myCarsTab.classList.add("active")
        upcomingBookingsTab.classList.remove("active")
        event.target.style.color="rgb(248, 171, 65)"
      } else {
        upcomingBookingsTab.classList.add("active")
        myCarsTab.classList.remove("active")
        event.target.style.color="rgb(248, 171, 65)"
      }
    })
  })
}

export { initCarsTabs };
