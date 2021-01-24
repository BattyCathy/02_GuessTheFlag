//
//  Notes.swift
//  02_GuessTheFlag
//
//  Created by Guy on 1/22/21.
//

import Foundation

//MARK: Day 20: Project 2, Part 1

//How did you find yesterday's challenge day? Unless you're an undiscovered programming prodigy, there's a good chance that you made a few mistake along the way, and there's even a good chance your app still has a couple bugs in it that you might not have noticed yet.

//And you know what? Tha's OK. Donald Knuth - computer science professor emeritus at Stanford - once wrote, "beware of bugs in the aboove code; I have only proved it correct, not tried it." And if even Donald Knuth warns people of potential bugs, I think it's Ok if we have a few of our own.

//Today we're moving onto our second project, so it's back to the overview day so we can look at some new SwiftUI techniques. It's another easy project, but you;ll be learning so many core SwiftUI techniques that you;ll be using for years to come.

//Today you have six topics to work through, and you'll meet VStack,  Image, Alert, and more.

//MARK: 1. Guess the Flag Intro

//In this second SwiftUI project we're going to be building a guessing game that helps users learn some of the many flags of the world.

//This project is still going to be nice and easy, but gives me a chance to introduce you to a whole range of new SwiftUI functionality: stacks, buttons, images, alerts, asset catalogs, and more.

//Our first app used a completely standard iOS look and feew, but here we're going to make something more customized so you can see how easy it is with SwiftUI.

//You're going to need to download some files for this project, which you can do from GitHub: hhtps://github.com/twostraws/HackingWithSwift - make sure you look in the SwiftUI section of the files.

//once you have those, go ahead and create a new Single View App template in Xcode called GuessTheFlag. As before we're going to be starting with an overview on the various SwiftUI technologies required to build the app, so let's get into it...

//MARK: 2. Using Stacks to Arrange Views

//When we return some View for our body, we mean "one specific type that conforms to the View protocol.

//If we want to return multiple things we have various optionas, but three are particualarly useful. They are HStack, VStack, and ZStack, which handle horizontal, veratical, and, er, zepth.

//Let's try it out. Our default template looks like this:

/*
 var body: some View {
    Text("Hello World")
 }
 */

//That returns one kind of view, which is a text view. If we wanted to return two text view, this kind of code simply isn't allowed:

/*
 var body: some View {
    Text("Hello World")
    Text("This is another text view")
 }
 */

//Instead, we need to make sure SwiftUI gets exactly one kind of view back, and that's where stacks come in: they allow us to say "here are two text views, and I want them to be positioned like this..."

//So, for VStack - a vertical stack of views - the two text views would be placed one above the other, this:

/*
 var body: some View {
    VStack {
        Text("Hello World")
        Text("This is inside a stack")
    }
}
 */

//By default VStack places little or no spacing between the two views, but we can control the spacing by providing a parameter when we create the stack, like this:

/*
 Vstack(spacing: 20) {
    Text("Hello World")
    Text("This is inside a stack")
    }
 }
 */

//Just like SwiftUI's other views, VStack can have a maximum of 10 children - if you want to add more, you should wrap them inside a Group.

//By default, VStack aligns its views so they are centered, but you can control that with its alignment property. For example, this aligns the text views to their leading edge, which in a left-to-right language such as English will cause them to be aligned to the left:

/*
 VStack(alignment: .leading) {
    Text("Hello World")
    Text("Hello World")
 }
 */

//Alongside VStack we have HStack for arranging things horizontally. This is the same syntax as VStack, including the ability to add spacing and alignment:

/*
 HStack(spacing: 20) {
    Text("Hello World")
    Text("This is inside a stack")
}
 */

//Vertical and horizontal stacks automatically fit their content, and prefer to align themselves to the center of the available sace. If you want to change that you can use one or more Spacer views to push the contents of your stack o one side. These automatically take up all remaining space, so if you add one at the end of a VStack it will push all your views to the tops of he screen:

/*
 VStack {
    Text("First")
    Text("Second")
    Text("Third")
    Spacer()
 }
 */

//If you add more than one spacer they will divide space between them.

//We also have ZStack for arranging things byy depth - it makes views that overlap. In the case of our two text views, this will make things rather hard to read:

/*
 ZStack {
    Text("Hello World")
    Text("This is inside a stack")
 }
 */

//ZStack doesn't have the concept of spacing because the views overlap, but it does have alignment. So, if you have one large thing and one small thing inside your ZStack, you can make both views align to the top like this: ZStack(alignment: .top) {

//ZStack draws its contents from top to bottom, back to front. This means if you have an image then some text ZStack wil draw them in that order, placing the text on top of the image.

//Try placing several horizontal stacks inside a vertical stack - can you make a 3 x 3 grid?

//MARK: 3. Colors and Frames

//SwiftUI gives us a range of functionality to render color, and manages to be both simple and powerful - a difficult combination, but one they really pulled off.

//To try this out, let's create a ZStack with a single text label:
/*
 ZStack {
    Text("Your content")
 }
 */

//If we want to piut something behind the text, we need to place it above it in the ZStack. But what if we wanted to put some red behind there - how would we do that?

//One option is to use the background() modifier, which can be given a color to draw like this:

/*
 ZStack {
    Text("You content")
}
 .background(Color.red)
 */

//That might have done what you expected, but there's a good chance it was a surprise: only the text view hadd a background color, even though we've asked the whole ZStack to have it.

//In fact, there's no differece between that code adn this:

/*
 ZStack {
    Text("Your content")
        .background(Color.red)
 }
 */

//If you want to fill in red the whole area behind the text, you should place the color into the ZStack - treat it as a whole view, all by itself:

/*ZStack {
    Color.red
    Text("Your Content")
 }
 */

//In fact, Color.red is a view in its own right, which is why it can be used like shapes and text. It automatically takes up all the space available, but you can also use the frame() modifier to ask for specific sizes:

/*
 Color.red.frame(width: 200, height: 200)
 */

//SwiftUI gives us a number of built-in colors to work with, such as Color.blue, Color.gree, and more. We also have some semantic colors: colors that don't say what hue they contain, but instead describe their purpose.

//For example, Color.primary is the default color of text in SwiftUI, and will either be black or white depending on whether the user's device is running in light mode or dark mode. There's also COlor.secondary, which is also black or white depending on the device, bbut now has a slight transparency so that a little of the color behind it shines through.

//If you need something specific, you can create custom colors by passing in values between 0 and 1 for red, green, and blue, like this:

//Color(red: 1, green: 0.8, blue: 0)

//Even when taking up the full screen, you'll see that using Color.red will leave some space white.

//How much space is white depends on your device, but on iPhone X designs - iPhone X, XS, and 11 - you'll find that both the status bar (the clock area at the top) and the home indicator (the horizontal strip at the bottom) are left uncolored.

//This space is intentionally blank, because Apple doesn't want important content to get obscured by other UI features or by any rounded corners on your device. So, the remaining part - that whole middle space - is called the safe area, and you can draw into it freely without worrying that it might be clipped by the notch on an iPhone.

//If you want your content to go under the safe area, you can use the edgesIgnoringSafeArea() modifier to specify which screen edges you want to run up to. For example, this creates a ZSack which fills the screen edge to edge with red then draws some text on top:
/*
 ZStack {
    Color.red.edgesIgnoringSafeArea(.all)
    Text("Your content")
 }
 */

//It is critically important that no important content be placed outside the safe area, because it might be hard if not impossible for the user to see. SOme views, such as List, allow content to scroll outside the safe area but then add extra insets so the user can scroll things into view.

//If your content is just decorative - like our background color here - then extending it outside the safe area is OK.

//MARK: 4. Gradients

//SwiftUI gice us three kinds of gradients to work with, and like colors they are also views that can be drawn in our UI.

//Gradients are made up of several components:

    //--An array of colors to show
    //--Size and direction information
    //--The type of gradient to use

//For example, a linear gradient goes in one direction, so we provide it with a start and an end point like this:

//LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)

//The inner Gradient type used there can also be provided with gradient stops, which let you specify both a color and how far along the gradient the color should be used.

//In contrast, radial gradients move outward in a circular shape, so instead of specifying a direction we specify a start and end radius - how far from the center of the circle the color should start and stop changing. For example:

//RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//The last gradient type is called an angular gradient, alothough you might have heard it referred to elsewhere as a conic or conical gradient. This cycles colors around a circle rather than radiating outward, and can create some beatiful effects.

//For example, this cylcles through a rand of colors in a single graddient, centered on the middle of the gradiente:

//AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)

//All of these gradients are able to stand alone as views, or be used as part of a modifier - you can use them as the background for a textview, for example.


//MARK: 5. Buttons and Images

//Buttons in SwiftUI can be made in two ways depending on how they should look.

//The simplest way to make a button is when it just contains some text: you bass in the titile of the button, along with a closure that should be run when the button is tapped:

/*
 Button("Tap me!") {
    print("Button was tapped")
 }
 */

//If you want something more, such as an image or combination of views, you can use this alternatice form

/*
 Button(action: {
    print("Button was tapped")
 }) {
    Text("Tap me!")
 }
 */

//This is particularly common when you want to incorporate images into your buttons.

//SwiftUI has a dedicated Image type for handling pictures in your apps, and there are three main ways you will create them:

//--Image("pencil") will load an image called "Pencil" that you have added to your project.

//--Image(decorative: "pencil") will load the same image, but won't read it out for users who have enabled the screen reader. This is useful for images that don't convey additional important information.

//--Image(systemName: "pencil") will load the pencil icon that is built into iOS. This uses Apple's SF symbols icon collection, and you can search for icons you like - download Apple's free SF symbols app from the web to see the full set.

//By default the screen reader will read your name if it is enables, so make sure you give your images clear names if you want to avoid confusings the user. Or, if they don't actuallly add information that isn't alread elsewhere on the screen, use the Image(decorative initializer.

//Becuase the longer form of buttons can have any kind of vies inside them, you can use images like this:

/*
 Button(action: {
    print("Edit button was tapped")
 }) {
    Image(systemName: "pencil")
 }
 */

//And of cousrse you can combine these with stacks to make much more advanced button layouts:

/*
 Button(action: {
    print("Edit button was tapped"
 }) {
    HStack(spacing: 10) {
        Image(systemName: "pencil")
        Text("Edit")
    }
 }
 */

//Tip: if you find that your images have become filled in with a color, for example showing as solid blue rather than your actual picture, this is probably SwiftUI coloring them th show that they are tappable. To fix that prblem, use the renderingMode(.original) modifier to force SwiftUI to show the original image rather than the recolored version.

//MARK: 6. Showing Alert Messages


//If something important happens, a common way of notifying the user is using an alert - a pop up window that contains a title, message, and one or two buttons depending on what you need.

//But think about it: when should an alert be shown and how? Views are a function of our program state, and alerts aren't an execption to that. So, rather than saying "show the alert", we instead create our alert and set th conditions under which is should be shown.

//A basic SwiftUI alert has a title, message, and one dismiss button, like this:

//Alert(title: TExt("Hello SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))

//You can add more complex code to cnfigure the buttons in more detail if you wnat, but that's enough for now. More interesting ifs how we present that alert: we don't assign the alert to a variable then write something like myAlert.show(), because that would be back to the old "series of events" way of thinking.

//Instead, we create some state that tracks whether our alert is showing, like this:

//@State private var showingAlert = false

//We then attach our alert somewhere to our user interface, telling it to use that state to determine whether the alert is presented or not. SwiftUI will watch showingAlert, and as soon as it becomes true it will show the alert.

//Putting that all together, here's some example code that shows an alert when a button is tapped:

/*
 struct ContentView: View {
    @STate private var showingAlert = false
 
    var body: some View {
        button("Show Alert" {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
 }
 */

//That attaches the alert to the button, but honestly it doesn't matter where the alert() modifier is used - all we're doing it saying that an alert exists and is shown when showingAlert is true.

//Take a close look at the alert() modifier:

//.alert(isPresented: $showingAlert)

//That's another two-way data binding, and it's here because SwiftUI will automatically set showingAlert back to false when the alert is dismissed.

//This is the final part of the overview for this project, so it's almost time to get started with the real code. If you want to save the examples you've programmed you should copy your project directory somewhere else.

//When you're ready, put ContentVeiw.swift back to the way it started when you first made the project.


//MARK: Day 21: Project 2, Part 2

//One of the things people often complain about while learning to program is that they really want to get busy making the Big App Idea they had, but instead they need to follow tutorials making different apps entirely.

//I know this can be annoying, but trust me: nothing you're learning here will be wasted. Sure, you might now evver make a flag guessing game, but the concepts you learn here - building layouts, tracking state, randomzing arrays, and more - that will last you for years.

//Oprah Winfrey once said, "do what you have to do until you can do what you want to do." By the end of this 100 days course I hope you'll be able to do ecatly what you want, but in the meantime stick with it - you're learning key skills here!

//Today you have three topics to work through, in which you'll apply your knowledge of VStack, LinearGradient, Alert, and more.

//MARK: 1. Stacking Up Buttons

//We're going to start our app by building the basic UI structure, which will be two labels telling tth user what to do then three image buttons showing three world flags.

//First, find the assets for this project and drag them into your asset catalog. That means opening Assets.xcassets in Xcode, then dragging in the flag names from the project2-files folder. You'll notice that the image are named after their country, along with either @2x oor @3x - these are images at double resolution and triple resolution to handle different types of iPhone screen.

//Next, we need two properties to store our game data: an array of all the counrty images we want to show in the game, plus an integer storing which country image is correct.

/*
 var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
 
 var correctAnswer = Int.random(in: 0..2)
 */

//The Int.random(in:) method actually picks a random number, which is perfect here - we'll be using that to decide which country flag should be tapped.

//Inside our body, we need to lay out our game prompt in a vertical stack, so let's start with that:

/*
 var body: some View {
    VStack {
        Text("Tap the flag of")
        Text(countries[correctAnswer])
    }
 }
 */

//Below there we want to have our tappable flag buttons, and while we could just add them to the same VStack, we can actually create a second VStack so that we have more control over the spacing.

//The VStack we just created above holds two text views and has no spacing, but the flags are going to have 30 points of spacing between them so it looks better.

//So, start by adding this ForEach loop directly below the end of the VStack we just created:

/*
 ForEach(0 ..< 3) { number in
    Button(action: {
    }) {
        Image(self.countries[number]
        .renderingMode(.original)
    }
 }
 */

//The rendingMode(.original) modifier tells SwiftUI to render the original image pixels rather than trying to recolor them as a button.

//And now we have a problem: our body property is trying to send back two views, aa VStack and a ForEach, but that isn't allowed. This is where our second VStack will come in: I'd like you to wrap the original VStack and the ForEach below in a new VStack, this time with  a spacing of 30 points.

//So your code should look like this:

/*
 var body: some View {
    VStack(spacing: 30) {
        VStack {
            Text("Tap the flag of")
                // etc
        }
        
        ForEach(0 ..< 3) { number in
            // etc
        }
    }
 }
 */

//Having two vertical stacks like this allows us to position things more precisely: the outer stack will space its views out by 30 points each, whereas the inner stack has no spacing.

//That's enough to give you a basic idea of our user interface, and already you'll see it doesn't look great - some flags have white in them, which blends into the background, an all the flags are ventered vertically on the screen.

//We'll come back to polish the UI later, but for now let's put in a blue background to make the flags leasier to see. Because this means putting something behind our outer VStack, we need to use a ZStack as well. Yes, we'll have a VStack inside another VStack inside a ZStack, and that its perfectly normal.

//Start by putting a ZStack around your outer VStack, like this:

/*
 var body: some View {
    ZStack {
        //previous VStack code
    }
 }
 */

//Now, put this just inside the ZStack, so it goes behing the outer VStack.

//Color.blue.edgesIgnoringSafeArea(.all)

//That edgesIgnoringSafeArea() modifier unsures the color goes right to the ende of the screen.

//Now that we have a darker background color, we should give the text something brighter so that it stand out better:

/*
 Text("Tap the flag of")
    .foregroundColor(.white)

 Text(countries[correctAnswer])
    .foregrounfColor(.white)
 
 //The last change we'll make, for now at least, is to push upwards all the things iin our outer VStack, so the UI sits next to the tops of the screen. This is as simpe as adding a spacer view directly after the end of the ForEAch:
 
 //Spacer()
 */
//MARK: 2. Showing the Player's Score with an Alert

//In order for this game to be fun, we need to randomize the order in which flags are shown, trigger an alert telling them whether they were right or wrong whenever they tap a flag, then reshuffle the flags.

//We already set correctAnswer to a random integer, but the flags always start in the same order. To fix that, we need to shuffle the countries array when the game starts, so modify the property to this:

//var countries = ["Estonia, "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", US"].shuffled()

//As you can see, the shuffled() method automatically takes care of randoizing the array order for us.

//Now for the more interesting part: when a flag has been tapped, what should we do? We need to replace the // flag was tapped comment with some code that determines whether they  tapped the correct flag or ot, and the bestt way of doing that is with a new methods that accepts the integer of the button and checks whether that matches our correctAnswer property.

//Regardless of whether they were correct, we want to show the user an alert saing what happened so they can track their progress. So, add this property to store whether the alert is showing or not:

//@State private var showingScore = false

//And add this property to store the title that will be shown iside the alert:

//@State private var scoreTitle = ""

//So, whatever method we write will accept the number of the button that was tapped, compare that against the correct answer, then set those two new properties so we can show a meaningful alert.

//Add this directly after the body property:

/*
 func flagTapped(_ number: Int) {
    if number == correctAnswer {
        scoreTitle = "Correct"
    } else {
        scoreTitle = "Wrong"
    }
    
    shoringScore = true
 }
 */

//We can now call that by replacing the // flag was tapped comment with this:

//self.flagTapped(number)

//We already have number because it's given to us by ForEach, so it's just a matter of passing that on to flagTapped().

//Before we show the alert, we need to think about what happens when the alert is dismissed. Obviously the game shouldn't be over, otherwise the whole thing would be over immediately.

//Instead we're going to write an askQuestion() method that resets the game by shuffling up the countries and picking a new corret answer:

/*
 func askQuesion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
 }
 */

//That code won't compile, and hopefully you'll see why pretty quickly: we're trying to change properties of our view that haven't been marked with @State, which isn't allowed. So, go to where countries and correctAnswer are declared, and put @State private before them, like this:

//@State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()


//And now we're ready to show the alert. This needs to:

//1. Use the alert() modifier so the alert gets presented when showingScore is true

//2. Show the title we set in scoreTitle.

//3. Have a dismiss button that calls askQuestion() when tapped.

//So, put this at the end of the ZStack property:
/*
 .alert(isPresented: $showingScore) {
    Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissBuutton: .default(Text("Continue")) {
        self.askQuestion()
    })
 }
 */
//MARK: 3. Styling our Flags

//Our game now works, although it doesn't look great. Fortunatley, we can make a few small tweaks to our design to make the whole thing look better.

//First, let's replace the solid blue background color with a linear gradient from blue to black, which ensures that even if a flag has a  similar blue strip it will still stand out against the background.

//So, find this line:

//Color.blue.edgesIgnoringSafeArea(.all)

//And replace with this:

//LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endpooint: .bottom)
    //.edgesIgnoringSafeArea(.all)


//It still ignores the safe area, ansuring that the background goes edge to edge.

//Now let's make the country name - the part they need to guess - the most prominent piece of text on the scree. We can do that with the font() modifier, which lets us select from one of the built-in font sizes on iOS, but we can add fontWeight() to it to make the text extra bold.

//Put these two modifier directly after the Text(countries[correctAnswer]) view:

/*
 .font(.largeTitle)
 .fontWeight(.black)
 */

//"Large title is the largest built-in font size iOS offers us, and automatically scales up or down depending on what setting the user has their fonts - afeature known as Dynamic Type.

//Finally, let's jazz up those flag images a little. SwifUI gives us a number of modifiers to affect the way views are presented, and we're going to use three here: one to change the shape of flags, one to add a bordr around the flags, and a third to add a shadow.

//There are four built-in shapes in Swift: rectangle, rounded rectangel, circle, and capsule. We'll be using capsule here: it ensures the corners of the sharpest edges are fully rounded, while the longest edges remain straight - it looks great for buttons. Making our image capsule is as easy as adding the .clipShape(Capsule()) modifier, like this:

//.clipShape(Capsule())

//As for drawing a border around the image, this is done using te overlay() modifier. This lets us draw another view over the flag, which in our case will be a capsule that has a black stroke around its edge. So, add this modifier after clipShape():

//.overlay(Capsule().stroke(Color.black, lineWidth: 1))

//And finally we want to apply a shadow effect around each flag, making them really stand out from the background. This is done using shadow(), which takes the color, radius, X, and Y offset of the shadow, but if you skip X and Y it assumes 0 for them. So, add this las modifier below the previeous two:

//.shadow(color: .black, radius: 2)

//So, our finished flag image looks like this:

/*
 Image(self.countries[number])
    .renderingMode(.original)
    .clipShape(Capsule())
    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
    .shadow(color: .black, radius: 2)
    
 */

//SwiftUI has so many modifiers that help us to adjust the way fonts and images are rendered. They all do exactly one thing, so it's common to stack them up as you can see above.

//MARK: Guess the Flag: Wrap up

//That;s another SwiftUI app completed, including lots of important new techniques. You'll use VStack, HStack, and ZStack in almost every project you make, and you'll see find you can quickly build complex layouts by combining them together.

//Many people find SwiftUI's way of showing alerts a little odd at first: creating it, adding a condition, then somply triggering that condition at some point in the future seems like a lot more work than just asking the alert to show itself. But like I said, it's important that our views always be a reflection of our program state, and that rules out us just showing alerts wherever we want to.

//MARK: Review what you learned

//Anyone can sit througha tutorial, but it take actual work to remember what was taught. It's my job to make sure you take as much from these tutorials as possible, so I've prepared a short review to help you check your learning.

//MARK: CHALLENGE

//One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try ectending this app to make sure you fully understand what's going on:

// 1. Add an @State property to store the user's score, modify it when they get an answer right or wrong, then display it in the alert.

// 2. Show the player's current score in a label directly below the flags.

// 3. When someone chooses the wrong flag, tell them their mistake in your alert message - something like "Wrong!" That's the flag of France," for example

//Admit it: building a SwiftUI app is fast, isn't it? Once you know the tools you're working with, you can turn around a complete game in under 15 minutes!
