const upcomingBookingsTab = document.querySelector("#upcoming-bookings")
const pastBookingsTab = document.querySelector("#past-bookings")

const initBookingsTabs = () => {
  const bookingTabsLinks = document.querySelectorAll(".booking-tab")
  bookingTabsLinks.forEach((btn) => {
    btn.addEventListener("click", (event) => {
      const ulTarget = event.target.dataset.target
      if (ulTarget === "upcoming-bookings") {
        upcomingBookingsTab.classList.add("active")
        pastBookingsTab.classList.remove("active")
      } else {
        pastBookingsTab.classList.add("active")
        upcomingBookingsTab.classList.remove("active")
      }
    })
  })
}

export { initBookingsTabs };
