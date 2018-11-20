'use strict';

// code from
// https://github.com/MrToph/generator-eos/blob/2.4.0/generators/app/templates/utils/index.js

const deploy = require('./deploy');
const others = require('./others');

module.exports = {
  ...deploy,
  ...others,
};
