function fetchData(url) {
    return fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .catch(error => {
            console.error('There was a problem with your fetch operation:', error);
        });
}

function displayData(data) {
    const outputDiv = document.getElementById('output');
    outputDiv.innerHTML = JSON.stringify(data, null, 2);
}

function fetchMembersByLocation(location) {
    fetchData(`/members?location=${location}`).then(displayData);
}

function fetchCarsByMake(make) {
    fetchData(`/vehicles?make=${make}`).then(displayData);
}

function fetchEngineerCount() {
    fetchData('/engineers/count').then(displayData);
}

function fetchMemberCount() {
    fetchData('/members/count').then(displayData);
}

function fetchBreakdownsAfterDate(date) {
    fetchData(`/breakdowns/after?date=${date}`).then(displayData);
}

function fetchBreakdownsBetweenDates(startDate, endDate) {
    fetchData(`/breakdowns/between?startDate=${startDate}&endDate=${endDate}`).then(displayData);
}

function fetchBreakdownCountByVehicle(vehicleReg) {
    fetchData(`/breakdowns/count?vehicleReg=${vehicleReg}`).then(displayData);
}

function fetchRepeatBreakdowns() {
    fetchData('/breakdowns/repeat').then(displayData);
}

