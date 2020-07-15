class Clock {
    constructor() {
        let date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();

        this.printTime()
        setInterval(this._tick.bind(this), 1000);
        // date._tick()
    }

    printTime() {
        console.log(this.hours + ':' + this.minutes + ':' + this.seconds)
    }

    _tick() {
        // setTimeout(function() {
        //     this.printTime();
        // },
        // 1000);

        if (this.seconds === 60) {
            this.minutes += 1;
            this.seconds = 0;
        }

        if (this.minutes === 60) {
            this.hours += 1;
            this.minutes = 0;
        } 

        if (this.hours === 24) {
            this.hours = 0;
        }




        this.seconds++;
        this.printTime();
    }
}

watch = new Clock

