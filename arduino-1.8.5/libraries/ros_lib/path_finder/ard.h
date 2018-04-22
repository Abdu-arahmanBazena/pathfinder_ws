#ifndef _ROS_path_finder_ard_h
#define _ROS_path_finder_ard_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "ros/time.h"

namespace path_finder
{

  class ard : public ros::Msg
  {
    public:
      typedef uint32_t _seq_type;
      _seq_type seq;
      typedef ros::Time _stamp_type;
      _stamp_type stamp;
      typedef const char* _frame_id_type;
      _frame_id_type frame_id;
      typedef float _ult_right_type;
      _ult_right_type ult_right;
      typedef float _ult_left_type;
      _ult_left_type ult_left;
      typedef float _ir_right_type;
      _ir_right_type ir_right;
      typedef float _ir_left_type;
      _ir_left_type ir_left;
      typedef float _compass_x_type;
      _compass_x_type compass_x;
      typedef float _compass_y_type;
      _compass_y_type compass_y;
      typedef float _compass_z_type;
      _compass_z_type compass_z;
      typedef uint64_t _servo_angle_type;
      _servo_angle_type servo_angle;

    ard():
      seq(0),
      stamp(),
      frame_id(""),
      ult_right(0),
      ult_left(0),
      ir_right(0),
      ir_left(0),
      compass_x(0),
      compass_y(0),
      compass_z(0),
      servo_angle(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->seq >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->seq >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->seq >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->seq >> (8 * 3)) & 0xFF;
      offset += sizeof(this->seq);
      *(outbuffer + offset + 0) = (this->stamp.sec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->stamp.sec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->stamp.sec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->stamp.sec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->stamp.sec);
      *(outbuffer + offset + 0) = (this->stamp.nsec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->stamp.nsec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->stamp.nsec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->stamp.nsec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->stamp.nsec);
      uint32_t length_frame_id = strlen(this->frame_id);
      varToArr(outbuffer + offset, length_frame_id);
      offset += 4;
      memcpy(outbuffer + offset, this->frame_id, length_frame_id);
      offset += length_frame_id;
      offset += serializeAvrFloat64(outbuffer + offset, this->ult_right);
      offset += serializeAvrFloat64(outbuffer + offset, this->ult_left);
      offset += serializeAvrFloat64(outbuffer + offset, this->ir_right);
      offset += serializeAvrFloat64(outbuffer + offset, this->ir_left);
      offset += serializeAvrFloat64(outbuffer + offset, this->compass_x);
      offset += serializeAvrFloat64(outbuffer + offset, this->compass_y);
      offset += serializeAvrFloat64(outbuffer + offset, this->compass_z);
      *(outbuffer + offset + 0) = (this->servo_angle >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->servo_angle >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->servo_angle >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->servo_angle >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (this->servo_angle >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (this->servo_angle >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (this->servo_angle >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (this->servo_angle >> (8 * 7)) & 0xFF;
      offset += sizeof(this->servo_angle);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      this->seq =  ((uint32_t) (*(inbuffer + offset)));
      this->seq |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->seq |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->seq |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->seq);
      this->stamp.sec =  ((uint32_t) (*(inbuffer + offset)));
      this->stamp.sec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->stamp.sec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->stamp.sec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->stamp.sec);
      this->stamp.nsec =  ((uint32_t) (*(inbuffer + offset)));
      this->stamp.nsec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->stamp.nsec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->stamp.nsec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->stamp.nsec);
      uint32_t length_frame_id;
      arrToVar(length_frame_id, (inbuffer + offset));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_frame_id; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_frame_id-1]=0;
      this->frame_id = (char *)(inbuffer + offset-1);
      offset += length_frame_id;
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->ult_right));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->ult_left));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->ir_right));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->ir_left));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->compass_x));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->compass_y));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->compass_z));
      this->servo_angle =  ((uint64_t) (*(inbuffer + offset)));
      this->servo_angle |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->servo_angle |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->servo_angle |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->servo_angle |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      this->servo_angle |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      this->servo_angle |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      this->servo_angle |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      offset += sizeof(this->servo_angle);
     return offset;
    }

    const char * getType(){ return "path_finder/ard"; };
    const char * getMD5(){ return "db57fb1eab133016c7f00c01572b2004"; };

  };

}
#endif