# *HereThereBe* #
### A GeoTagging Quality-of-Life Observations App ###

Thanks for checking out HereThereBe! This is the development line where I'm actually building out the app, making changes, testing, etc.

The idea behind HereThereBe is to create a simple mobile app that people can use to make themselves and others aware of hotspots for various quality of life issues and environmental hazards within certain geographical areas.

When users want to post an observation of an issue, they will be able to quickly and easily submit an observation with just a single line of text (and possibly an image as well in later versions), which will be tagged by HereThereBe's backend and then added to an overall aggregation of tags at that geolocation. The tagging system will ensure cohesion with local services' databases as well as filter out undesirable activity that could be classified as malicious, offensive, or spam. If there is a local information and reporting service such as 311 available, and a tag matches an issue that could be reported to that service, the user will be offered the ability to report to that service either in app or via a link to the relevant site.
Within a map frame, users will be able to search for an issue of concern such as "bedbugs" or "traffic noise". HereThereBe will find observations with the closest matching tags and create an overlay on the map, showing concentrations of higher or lower density of similar complaints relative to the area. Users will also be able to opt to include relevant data from the NYC OpenData initiative and other similar regional information databases in these maps, if data relative to the desired issue is available.

### Basic Features ###
- [ ] iOS App: Simple UI With Maps, Create Button, and Search Bar
- [ ] iOS App: Model data for display and communication with backend
- [ ] iOS App: Tab View to display HereThereBe observations, local authorities info, or both
- [ ] iOS App: Separate view for submitting request to 311 (text fields or browser view)
- [ ] Vapor Backend: Storage and Querying
- [ ] Vapor Backend: Tag warnings by text parsing, determine relevant 311 category
- [ ] Vapor Backend: Basic Authorization, Validation, and Security

### Extra Features ###
- [ ] Vapor Backend: Authenticate and track individual users to prevent spam and abuse.
- [ ] Vapor Backend: Determine areas of high, medium, low observation concentration within a given area and pass this data to iOS App.
- [ ] Vapor Backend: Support local info and reporting services from a variety of localities (other cities and areas besides NYC)
- [ ] iOS App: Model and display areas of varying observation concentration in an overlay over the map.
- [ ] iOS App: Different map overlays with a variety of data views.
- [ ] iOS App: **"Here There Be" view** Old timey map with pirate aesthetic marking the most common observation by geographical area with images
- [ ] iOS App: Beautify UI with custom icons and image based UI.
- [ ] Both ends: Integration with social media
- [ ] Both ends: Allow the user to add a photo along with warnings
- [ ] iOS App: Ongoing support and maintenance across iOS and Swift updates post-release
- [ ] Web and Android clients to expand userbase and datasets
