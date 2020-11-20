const upcomingBookingsTab = document.querySelector("#upcoming-bookings")
const pastBookingsTab = document.querySelector("#past-bookings")

const initBookingsTabs = () => {
  const bookingTabsLinks = document.querySelectorAll(".booking-tab")
  bookingTabsLinks.forEach((btn) => {

    btn.addEventListener("click", (event) => {
      const ulTarget = event.target.dataset.target
      bookingTabsLinks.forEach((btn2) => {
        btn2.style.color="black"
      })
      if (ulTarget === "upcoming-bookings") {
        upcomingBookingsTab.classList.add("active")
        pastBookingsTab.classList.remove("active")
        event.target.style.color="rgb(248, 171, 65)"
      } else {
        pastBookingsTab.classList.add("active")
        upcomingBookingsTab.classList.remove("active")
        event.target.style.color="rgb(248, 171, 65)"
      }
    })
  })
}

export { initBookingsTabs };
