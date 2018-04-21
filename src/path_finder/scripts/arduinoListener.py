#!/usr/bin/env python
import rospy
from path_finder.msg import ard

def callback(data):
	rospy.loginfo(rospy.get_caller_id() + "ult_right %s", data.ult_right)
	rospy.loginfo(rospy.get_caller_id() + "ult_left %s", data.ult_left)
	rospy.loginfo(rospy.get_caller_id() + "ir_right %s", data.ir_right)
	rospy.loginfo(rospy.get_caller_id() + "ir_left %s", data.ir_left)
	rospy.loginfo(rospy.get_caller_id() + "seq %s", data.seq)
	rospy.loginfo(rospy.get_caller_id() + "time %s", data.stamp)
    
def listener():

	# In ROS, nodes are uniquely named. If two nodes with the same
	# node are launched, the previous one is kicked off. The
	# anonymous=True flag means that rospy will choose a unique
	# name for our 'listener' node so that multiple listeners can
	# run simultaneously.
	rospy.init_node('arduino_readings_listener', anonymous=True)

	rospy.Subscriber("arduino_readings", ard, callback)

	# spin() simply keeps python from exiting until this node is stopped
	rospy.spin()

if __name__ == '__main__':
	listener()
