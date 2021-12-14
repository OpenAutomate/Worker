

## Open Automate Project:

**How can a machine be made to automate chores?**

<dl>
<dd>
A similar problem is occurring today with self-driving cars. The car company Tesla approached this problem by learning from the people driving their cars. People control the cars, and the cars learn to drive. We will use the same approach. People control the machines, and the machines learn to perform tasks.
</dd>
</dl>
    
**Why chores?**

<dl>
<dd>
The first tasks we train for must be available to all contributors of the project; therefore we will target tasks within homes: doing laundry, cleaning dishes, and cooking. A machine proven to automate household chores through mass training should lead to many more tasks being automated the same way!
</dd>
</dl>
    
**How can we start training this machine as a community?**

<dl>
<dd>
Once the design has been finalized, you can build your own or we will fundraise in order for you to be able to order a fully assembled machine. You can help complete the design by completing tasks in the <a href="https://github.com/OpenAutomate/Worker/blob/main/README.md#todo">Todo section</a>. You can discuss with the community on the Open Automate <a href="https://discord.gg/WbYnjcPEGg">Discord</a> & <a href="https://www.reddit.com/r/openautomate/">Reddit</a>.
</dd>
</dl>

## Design:

&emsp; This animation demonstrates Worker's movement capabilities and labels its main components:

https://user-images.githubusercontent.com/90941349/144725070-27ede840-f3eb-4ef1-ad22-a54836969026.mp4

<hr>

Here is a view of the inside of the base. You can see the indent to mount the caster wheel and the spine mount. The hole at the right edge of the spine mount is for the wires of the linear actuator:

![Base_Comparison](https://user-images.githubusercontent.com/90941349/145729408-ba47fe69-4f4f-432e-99fc-ea12dbf68e72.png)

<hr>

Here is a view of the inside of the chest from the back. You can see a mount for the spine in the middle, and stepper mounts on the right and left. The stepper mounts are for the stepper motors that give the arms left and right movement:

![Chest_Inside](https://user-images.githubusercontent.com/90941349/145729459-c3f456ff-a9fe-4327-a263-44f8c164c10d.png)

<hr>

Here is the inside of the chest, but with the shoulder stepper motors included. The left and right stepper motor is in green, the up and down stepper motor is in red. The blue object is a printed part to hold the red stepper motor. The blue object should be made of metal and welded to the shaft of the green stepper motor: 

![Shoulder_Backplate](https://user-images.githubusercontent.com/90941349/145729564-6e2dd91c-bc79-4111-a277-7f934936dd11.png)

<hr>

Here is another view of the shoulders, but from the side:

![Shoulder_Shoulder_Hole](https://user-images.githubusercontent.com/90941349/145729583-d9f7fa61-946c-47c2-98cd-0d357cd85246.png)

<hr>

Here is a picture of the printed parts isolated from other components. All other components, such as the linear actuator arms and spine, will not be custom made:

![STL_Parts](https://user-images.githubusercontent.com/90941349/145729998-7a7ef9da-3539-45dd-b0e9-681c27a392c8.png)

## Design Q&A:

<dl>
<dd>
This section explains the decisions made behind the design. The design can be seen within the <a href="https://github.com/OpenAutomate/Worker#design">design video.</a> Overall, the design is meant to emulate human functions. You can help by suggesting design improvements as an issue.
</dd>
</dl>

**Why was Openscad used to design?**

<dl>
<dd>
There will be different versions using different CAD softwares in different repo branches. Freecad & Openscad will primarily be maintained as they are free open-source software that anyone in the community has access to.
</dd>
</dl>

**Why are the arms linear actuators and not robotic arms?**

<dl>
<dd>
In this case, it seems that linear actuators paired with Worker being able to move it's shoulders up, down, left and right; extend and contract it's spine; and rotate it's wheels, are enough to accomplish most tasks. Linear actuators are also easier to control for training and cost significantly less relative to the cost of robotic arms. There still may be a version of Worker with robotic arms at an increased cost.
</dd>
</dl>

**Why does it have wheels instead of robotic legs?**

<dl>
<dd>
In this case, it seems that wheels are enough to navigate to accomplish most tasks. If there is an obstacle in the way, Worker can use it's arms to move it rather than step over it. If there are stairs, perhaps the arms can be used to push off the ground and up each stair. Wheels are also easier to control for training and cost significantly less relative to the cost of robotic legs. There still may be a version of Worker with robotic legs at an increased cost.	
</dd>
</dl>

**Why are there no hands?**

<dl>
<dd>
It is being considered whether the hands will be detachable, in order to have different hands for different tasks.		
</dd>
</dl>

**Why doesn't the neck move?**

<dl>
<dd>
It doesn't move up and down because the eyes and spine will move up and down. It doesn't move left and right because the wheels will rotate left and right. Neck movement would increase cost and complexity for training Worker to perform tasks. There still may be a version of Worker with a moving neck at an increased cost.	
</dd>
</dl>

**Why was this height chosen?**

<dl>
<dd>
At it's shortest, Worker's height will be around 4 foot 10 inches. Worker should be short enough for the hands to reach the floor. It should also be short enough to not be intimidating. However, it can still extend its spine to reach high places.
</dd>
</dl>

**Why not have a touchscreen as a face?**

<dl>
<dd>
Workers will be able to be interacted with through a smartphone app. Also, the main way to interact with people is speaking, so perhaps Workers should be the same. A touchscreen would also increase cost.
</dd>
</dl>

**Why is the machine named 'Worker'?**

<dl>
<dd>
It most simply defines what this machine is meant to do - work.
</dd>
</dl>

**Why is the head shaped like that?**

<dl>
<dd>
It is just for aesthetics, but it also portrays one of the main functions of the head - vision. 
</dd>
</dl>

**Why is the chest shaped like that?**

<dl>
<dd>
It was initially a squared cube, but the corners were cut off so the hands could touch each other.
</dd>
</dl>

**Why is the base shaped like that?**

<dl>
<dd>
It is just for aesthetics.
</dd>
</dl>

## Build Guide (In-Development):

This section describes how to build a Worker from the ground up. This section is still in development. 

1. Order 3D printed pieces of Worker. The STL files of pieces to be printed are in the 'STL' folder of this repo. Here is a list of the parts to be printed:
	- Head x1
	- Head Backplate x1
	- Neck x1
	- Shoulder x2
	- Chest x1
	- Chest Backplate x1
	- Base x1
	- Base Backplate x1

2. Order non-printed materials of Worker. Here is a list of those materials:
	- 400mm Linear Actuator x2
	- 600mm Linear Actuator x1
	- Cameras x2
	- Microphone x2
	- Speaker x1
	- Wheel x2
	- Caster Wheel x1
	- Mechanical Gripper x2
	- Raspberry Pi x1
	- 400w Battery x1
	- 10mm Screws x4 (Head Backplate)
	- 10mm Screws x2 (Raspberry Pi)
	- 10mm Screws x2 (Camera Motor Driver)
	- 10mm Screws x4 (Chest Backplate)
	- 10mm Screws x8 (Shoulder Motor Drivers)
	- 10mm Nut & Bolt x8 (Shoulder Motors)
	- 10mm Screws x3 (Base Backplate)
	- 10mm Screws x2 (Battery)
	- 10mm Screws x4 (Wheel Motor Drivers)
	- 10mm Nut & Bolt x8 (Wheel Motors)
	- NEMA17 Stepper Motor x1 (Cameras)
	- NEMA23 Stepper Motor x4 (Shoulders)
	- NEMA23 Stepper Motor x2 (Wheels)
	- NEMA17 Motor Driver x1 (Cameras)
	- NEMA23 Motor Driver x4 (Shoulders)
	- NEMA23 Motor Driver x2 (Wheels)
	- Screwdriver
	- Adhesive 

3. Assemble the base. 
	1. Mount the caster wheel to the base backplate indent with nuts and bolts.
	2. Mount NEMA23 stepper motors to base wheel mounts with nuts and bolts. 
	3. Attach wheels to NEMA23 stepper motor shafts using an adhesive.
	4. Attach 600mm linear actuator to base backplate mount using adhesive. 
	5. Mount battery and NEMA23 motor drivers in the base chassis using screws.
	6. Wire up stepper motors, linear actuator, battery, and motor drivers.
	7. Attach base backplate to the base using screws.

4. Assemble the chest. 
	1. Attach the 600mm linear actuator to the chest mount using an adhesive.
	2. Attach two sets of NEMA23 stepper motors together using an adhesive.
	3. Mount each set of NEMA23 stepper motors to the shoulder mounts using nuts and bolts.
	4. Attach the speaker to the chest speaker hole using an adhesive. 
	5. Mount NEMA23 motor drivers in the chest chassis using screws. 
	6. Wire up stepper motors, linear actuator, and motor drivers.
	7. Attach chest backplate to the chest using screws.

5. Assemble the arms.
	1. Attach the 400mm linear actuators to the shoulder stepper motor shafts using an adhesive.
	2. Wire up the linear actuators. 

6. Assemble the head.
	1. Attach the cameras to the NEMA16 stepper motor using an adhesive.
	2. Attach NEMA16 stepper motor to faceplate using an adhesive.
	3. Mount raspberry pi to the microcomputer mount using nuts and bolts.
	4. Attach microphones to microphone holes on sides of head using an adhesive
	5. Wire up camera, stepper motor, raspberry pi, and microphones.
	6. Attach head backplate to the head using screws.

## Training ML Software:

This section will describe how the machine learning software used to train Worker will work.

## Training Controller Software:

This section will describe how the controller software used to control Worker will work.

## Todo:

This section is a list of tasks that need to be completed or debated on:

<dl>
<dd>

**Design**

- [ ] Should the printed parts be in plastic or aluminum? Why?
- [ ] Specifically what (component) should be used? Please link a specific product:
	> wheel stepper motors,
	> wheel motor drivers,
	> battery,
	> wheels,
	> mechanical grippers,
	> spine linear actuator,
	> shoulder stepper motors,
	> shoulder motor drivers,
	> arm linear actuators,
	> arm motor drivers,
	> speaker,
	> microcontroller,
- [ ] Threaded screwholes CAD needs to be redone for all backplates, and electronic component mounting screwholes.
- [ ] What material should be used to cover the shoulder hole on the chest while still allowing shoulder movement? Why?
- [ ] What material should be used to cover the eye holes on the head while still allowing eye movement? Why?

**Build Guide**

- [ ] Write a description of how to wire up all of the electronic components.

- [ ] What adhesive should be used to attach the microphones to the head?
- [ ] What adhesive should be used to attach the speaker to the chest?
- [ ] What adhesive should be used to attach the wheels to the wheel motors?
- [ ] What adhesive should be used to attach the spine to the base spine mount?
- [ ] What adhesive should be used to attach the spine to the chest spine mount?
- [ ] What adhesive should be used to attach the cameras to the camera motor?
- [ ] What adhesive should be used to attach the camera motor to the head?
- [ ] What adhesive should be used to attach the shoulder stepper motors to the arms?
- [ ] What adhesive should be used to attach the mechanical grippers to the arms?

**Training ML Software**

- [ ] What machine learning library should be used? Why?
- [ ] Begin programming the machine learning software.

**Training Controller Software**

- [ ] What kind of controller should used to control/train Worker? Why?
- [ ] What software would be used for the controller?
- [ ] Begin programming the controller software.

</dd>
</dl>
