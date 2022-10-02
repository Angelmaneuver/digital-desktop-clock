command:          "date +\"%H.%M.%S.%m/%d.%a\""
refreshFrequency: 1000

render: (output) -> """
  <div id="clock">
    <div class="container">
      <span id="hours"></span>
      <span class="blinky">:</span>
      <span id="minutes"></span>
      <span class="blinky">:</span>
      <span id="seconds"></span>
    </div>
    <div class="container">
      <span id="date"></span>
      <span id="day"></span>
    </div>
  </div>
"""

update: (output) ->
  data = output.split('.')
  $(hours).html(data[0])
  $(minutes).html(data[1])
  $(seconds).html(data[2])
  $(date).html(data[3])
  $(day).html(data[4].toUpperCase())

style: (->
  return """
    @font-face {
      font-family:   'D14CI';
      src:           url('/digital-desktop-clock/digital-desktop-clock.widget/fonts-DSEG/DSEG14-Classic/DSEG14Classic-Italic.woff') format('woff');
    }
    @keyframes neon {
      from {
        text-shadow: 0 0 10px #ffffff, 0 0 20px #ffffff, 0 0 30px  #ffffff, 0 0 40px  #0aafe6,
                     0 0 70px #0aafe6, 0 0 80px #0aafe6, 0 0 100px #0aafe6, 0 0 150px #0aafe6;
      }
      to {
        text-shadow: 0 0 5px  #ffffff, 0 0 10px #ffffff, 0 0 15px #ffffff,  0 0 20px #0aafe6,
                     0 0 35px #0aafe6, 0 0 40px #0aafe6, 0 0 50px #0aafe6,  0 0 75px #0aafe6;
      }
    }
    span {
      font-family:   'D14CI', monospace;
      margin:        0;
      padding:       0;
      animation:     neon 1s ease-in-out infinite alternate;
    }
    #clock {
      position:      fixed;
      display:       inline-block;
      box-sizing:    border-box;
      height:        70px;
      padding:       0.5em;
      border-radius: 0.5em;
      color:         #daf6ff;

      top:           35em;
      left:          6em;
      background:    rgba(#000000, 0);
    }
    .container {
      position:      inline-block;
      width:         100%;
      text-align:    center;
    }
    #hours,
    #minutes,
    #seconds {
      display:       inline-block;
      font-size:     3em;
    }
    #hours:before,
    #minutes:before,
    #seconds:before {
      position:      fixed;
      content:       '~~';
      color:         rgba(#daf6ff, 0.1);
      text-shadow:   none;
    }
    .blinky {
      font-size:     3em;
    }
    #date,
    #day {
      font-size:     1.5em;
      opacity:       0.7;
      margin:        5px;
    }
    #hours:before,
    #minutes:before,
    #date:before,
    #day:before {
      position:      fixed;
      color:         rgba(#daf6ff, 0.1);
      text-shadow:   none;
    }
    #hours:before,
    #minutes:before {
      content:       '~~';
    }
    #date:before {
      content:       '~~/~~';
    }
    #day:before {
      content:       '~~~';
    }
  """
)()