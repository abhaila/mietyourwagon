const myCarsTab = document.querySelector("#my-cars")
const upcomingBookingsTab = document.querySelector("#my-cars-bookings")

const initCarsTabs = () => {
  const carTabsLinks = document.querySelectorAll(".cars-tab")
  carTabsLinks.forEach((btn) => {
    btn.addEventListener("click", (event) => {
      const ulTarget = event.target.dataset.target
      carTabsLinks.forEach((btn2) => {
        btn2.style.color="black"
      })
      if (ulTarget === "my-cars") {
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
